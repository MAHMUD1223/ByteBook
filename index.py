import werkzeug
from flask import Flask, send_file, url_for

app = Flask(__name__)


@app.route('/_/')
def urls():
    alldir = dir()
    link = ""
    link_list = []
    for i in alldir:
        try:
            link += f'<a href=\"{url_for(i)}\">{i}</a> <br>'
            link_list.append(f'{url_for(i)}')
        except werkzeug.routing.exceptions.BuildError:
            pass
    return f'''<html>
               <body>
                <h1 align="center">Welcome to the Backside of The app</h1>
                <div align="center">{link}</div><br> 
                <br> and it's endpoint data is :- {link_list} and has {len(link_list)} links
                </body>
                </html>'''


@app.route('/')
def index():
    return "This is a web development server"

@app.route('/htmx')
def htmx():
    return send_file('htmx/main.html')


@app.route('/alpine')
def alpine():
    return send_file('alpine-js/main.html')


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
