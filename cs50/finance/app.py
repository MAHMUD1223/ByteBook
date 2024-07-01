import os

from cs50 import SQL
from flask import Flask, flash, redirect, render_template, request, session
from flask_session import Session
from werkzeug.security import check_password_hash, generate_password_hash

from helpers import apology, login_required, lookup, usd

# Configure application
app = Flask(__name__)

# Custom filter
app.jinja_env.filters["usd"] = usd

# Configure session to use filesystem (instead of signed cookies)
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

# Configure CS50 Library to use SQLite database
db = SQL("sqlite:///finance.db")


@app.after_request
def after_request(response):
    """Ensure responses aren't cached"""
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Expires"] = 0
    response.headers["Pragma"] = "no-cache"
    return response


@app.route("/")
@login_required
def index():
    uid = session["user_id"]
    portfolio = db.execute("SELECT * FROM portfolios WHERE user_id = ?", uid)
    cash_left = db.execute("SELECT cash FROM users WHERE id = ?", uid)

    if cash_left and "cash" in cash_left[0]:
        cash_left = float(cash_left[0]["cash"])
    else:
        cash_left = 0.0

    total_amount = cash_left
    try:
        for stock in portfolio:
            symbol = stock["symbol"]
            stock_info = lookup(symbol)

            current_price = float(stock_info["price"])
            stock_value = current_price * stock["shares"]

            stock.update({"current_price": current_price, "stock_value": stock_value})
            total_amount += float(stock["stock_value"])
    except (ValueError, LookupError):
        return apology("Failed to update stock prices!")

    return render_template("index.html", portfolio=portfolio, cash_left=cash_left, total_amount=total_amount)


@app.route("/buy", methods=["GET", "POST"])
@login_required
def buy():
    """Buy shares of stock"""
    if request.method == "POST":
        uid = session["user_id"]
        symbol = request.form.get("symbol")
        shares = request.form.get("shares")
        stock = lookup(symbol)

        if not symbol or not stock:
            return apology("Symbol not valid!")
        if not shares.isdigit():
            return apology("Please enter a positive value!")

        share_value = int(shares)*stock["price"]
        user_balance = (db.execute("SELECT * FROM users WHERE id=?", uid))[0]["cash"]

        if user_balance < share_value:
            return apology("Not enough Money!")

        new_balance = user_balance-share_value
        balance = f"${new_balance:,.2f} - ${share_value:,.2f}"

        db.execute("UPDATE users SET cash=? WHERE id=?", new_balance, uid)
        db.execute("INSERT INTO portfolios (user_id, symbol, shares, paid_price, current_price, stock_value) VALUES (?, ?, ?, ?, ?, ?)",
                   uid,
                   symbol,
                   shares,
                   stock["price"],
                   stock["price"],
                   stock["price"]
                   )
        db.execute("INSERT INTO history (user_id, symbol, shares, action, balance) VALUES (?, ?, ?, ?, ?)",
                   uid,
                   symbol,
                   shares,
                   "BOUGHT",
                   balance
                   )
        flash(f"Successfully brought {shares} shares of {symbol}")
        stock["price"] = usd(stock["price"])
        return render_template("buy2.html", symbol=symbol, stock=stock, shares=shares, total=usd(share_value), cash=f"{new_balance:,.2f}", prev=f"{user_balance:,.2f}")
    return render_template("buy.html")


@app.route("/history")
@login_required
def history():
    """Show history of transactions"""
    uid = session["user_id"]
    history = db.execute("SELECT * FROM history WHERE user_id=? ORDER BY date DESC", uid)
    return render_template("history.html", history=history)


@app.route("/login", methods=["GET", "POST"])
def login():
    """Log user in"""

    # Forget any user_id
    session.clear()

    # User reached route via POST (as by submitting a form via POST)
    if request.method == "POST":
        # Ensure username was submitted
        if not request.form.get("username"):
            return apology("must provide username", 403)

        # Ensure password was submitted
        elif not request.form.get("password"):
            return apology("must provide password", 403)

        # Query database for username
        rows = db.execute(
            "SELECT * FROM users WHERE username = ?", request.form.get("username")
        )

        # Ensure username exists and password is correct
        if len(rows) != 1 or not check_password_hash(
            rows[0]["hash"], request.form.get("password")
        ):
            return apology("invalid username and/or password", 403)

        # Remember which user has logged in
        session["user_id"] = rows[0]["id"]

        # Redirect user to home page
        return redirect("/")

    # User reached route via GET (as by clicking a link or via redirect)
    else:
        return render_template("login.html")


@app.route("/logout")
def logout():
    """Log user out"""

    # Forget any user_id
    session.clear()

    # Redirect user to login form
    return redirect("/")


@app.route("/quote", methods=["GET", "POST"])
@login_required
def quote():
    """Get stock quote."""
    if request.method == "POST":
        stock = lookup(request.form.get("symbol"))
        if not stock:
            return apology("Symbol not found try again!")
        stock["price"] = usd(stock["price"])
        return render_template("quote2.html", stock=stock)
    return render_template("quote.html")


@app.route("/register", methods=["GET", "POST"])
def register():
    """Register user"""
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password")
        confirmation = request.form.get("confirmation")
        if any(not field for field in [username, password, confirmation]):
            return apology("Fields cannot be empty!")
        if len(username) < 4:
            return apology("Username must be at least 4 characters long!", 403)
        if len(db.execute("SELECT * FROM users WHERE username=?", username)) > 0:
            return apology("Username is already taken!", 400)
        if password!=confirmation:
            return apology("Password doesn't match",400)
        hashpass = generate_password_hash(confirmation)
        db.execute("INSERT INTO users (username, hash) VALUES (?, ?)", username, hashpass)
        rows = db.execute("SELECT * FROM users WHERE username=?", username)
        session["user_id"] = rows[0]["id"]
        flash(f"Successfully created user {username}")
        return redirect("/")
    return render_template("register.html")


@app.route("/sell", methods=["GET", "POST"])
@login_required
def sell():
    """Sell shares of stock"""
    uid = session["user_id"]
    portfolio = db.execute("SELECT * FROM portfolios WHERE user_id = ?", uid)

    if request.method == "POST":
        symbol = request.form.get("symbol")
        shares = int(request.form.get("shares"))
        stock = lookup(symbol)

        owned_stock = db.execute(
            "SELECT shares FROM portfolios WHERE user_id=? AND symbol=?", uid, symbol)
        owned_stock_portfolio = db.execute(
            "SELECT * FROM portfolios WHERE user_id=? AND symbol=?", uid, symbol)
        if not owned_stock:
            return apology(f"You don't have any shares of {symbol}")

        current_shares = sum([stock["shares"] for stock in owned_stock])
        if current_shares < shares:
            return apology("You don't have enough shares to sell!")

        cash = (db.execute("SELECT cash FROM users WHERE id = ?", uid))[0]["cash"]

        current_price = stock["price"]
        cash += shares * current_price

        for info in owned_stock_portfolio:
            if info["shares"] > shares:
                db.execute(
                    "UPDATE portfolios SET shares = ? WHERE user_id = ? AND symbol = ? AND id=?",
                    info["shares"] - shares,
                    uid,
                    symbol,
                    info["id"]
                )
                break
            elif info["shares"] == shares:
                db.execute("DELETE FROM portfolios WHERE user_id = ? AND symbol = ?", uid, symbol)
                break
            elif info["shares"] < shares:
                shares -= info["shares"]
                db.execute("DELETE FROM portfolios WHERE user_id = ? AND symbol = ? AND id=?",
                           uid, symbol, info["id"])
        db.execute("UPDATE users SET cash=? WHERE id=?", cash, uid)
        balance = f"${cash:,.2f} + ${(shares * current_price):,.2f}"
        db.execute(
            "INSERT INTO history (user_id, symbol, shares, action, balance) VALUES (?, ?, ?, ?, ?)",
            uid,
            symbol,
            shares,
            "SOLD",
            balance
        )

        flash(f"Successfully sold {shares} shares of {symbol}!")
        return redirect("/")
    return render_template("sell.html", portfolio=portfolio)


@app.route("/deposit", methods=["GET", "POST"])
@login_required
def deposit():
    if request.method == "POST":
        uid = session["user_id"]
        amount = int(request.form.get("sum"))
        account = db.execute("SELECT * FROM users WHERE id = ?", uid)
        if not check_password_hash(account[0]["hash"], request.form.get("password")):
            return apology("Worng Password Try Again!")

        db.execute("UPDATE users SET cash=? WHERE id=?", account[0]["cash"]+amount, uid)
        flash(f"Successfully Added ${amount} into your account!")
        return redirect("/")
    return render_template("deposit-withdraw.html", evt="deposit")


@app.route("/withdraw", methods=["GET", "POST"])
@login_required
def withdraw():
    if request.method == "POST":
        uid = session["user_id"]
        amount = int(request.form.get("sum"))
        account = db.execute("SELECT * FROM users WHERE id = ?", uid)

        if not check_password_hash(account[0]["hash"], request.form.get("password")):
            return apology("Worng Password Try Again!")
        if amount > account[0]["cash"]:
            return apology("Cannot withdraw more than cash left!")

        db.execute("UPDATE users SET cash=? WHERE id=?", account[0]["cash"]-amount, uid)
        flash(f"Successfully Withdrawn ${amount} from your account!")
        return redirect("/")
    return render_template("deposit-withdraw.html", evt="withdraw")


@app.route("/edit-password", methods=["GET", "POST"])
@login_required
def editpassword():
    if request.method == "POST":
        uid = session["user_id"]
        password = request.form.get("password")
        confirmation = request.form.get("confirmation")

        if any(not field for field in [password, confirmation]):
            return apology("Fields cannot be empty!")
        if password != confirmation:
            return apology("Password must match!")
        hashpass = generate_password_hash(confirmation)
        db.execute("UPDATE users SET hash=? WHERE id=?", hashpass, uid)
        flash("Successfully changed the password!")
    return render_template("edit_password.html")
