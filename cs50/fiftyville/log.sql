-- Keep a log of any SQL queries you execute as you solve the mystery.
-- knowing about the database structre
.schema
-- Looking for the crime reports of July 28
SELECT *
FROM crime_scene_reports
WHERE day=28 AND month=7;
-- Reading the three witness transcript
SELECT *
FROM interviews
WHERE day=28 AND month=7;
-- Using the three clue and fitering people
SELECT *
FROM people
WHERE license_plate IN (
    SELECT license_plate
    FROM bakery_security_logs
    WHERE activity = "exit" AND month = 7 AND day = 28 AND hour = 10 AND minute BETWEEN 15 AND 40
)
AND phone_number IN (
    SELECT caller
    FROM phone_calls
    WHERE month = 7 AND day = 28 AND duration < 60
)
AND people.id IN (
    SELECT person_id
    FROM bank_accounts
    WHERE bank_accounts.account_number IN (
        SELECT account_number
        FROM atm_transactions
        WHERE month = 7 AND day = 28 AND atm_location = "Leggett Street" AND transaction_type = "withdraw"
    ));
-- suspects found: Taylor, Daiana, Bruce
-- To get the other suspects we can check the phone reciver of them
SELECT *
FROM people
WHERE phone_number IN (
    SELECT receiver
    FROM phone_calls
    WHERE day=28 AND month=7 AND duration < 60 AND caller IN ("(286) 555-6063", "(770) 555-1861", "(367) 555-5533")
);
-- Getting other three - James, Philip and Robin
-- Making the set of suspect
SELECT *
FROM phone_calls
WHERE month = 7 AND day = 28 AND duration < 60
AND caller IN ("(286) 555-6063", "(770) 555-1861", "(367) 555-5533")
AND receiver IN ("(676) 555-6554", "(725) 555-3243", "(375) 555-8161");
-- Here Taylor called James, Diana called Philip and Bruce Called Robin
-- Checkiing foor early Flight leave
SELECT full_name, city
FROM airports
WHERE id IN (
    SELECT destination_airport_id
    FROM flights
    JOIN airports
    ON airports.id = flights.origin_airport_id
    WHERE flights.month = 7 AND flights.day = 29 AND flights.hour BETWEEN 00 AND 12 AND airports.city = "Fiftyville"
    ORDER BY flights.hour, flights.minute
);
-- Three earliest flight is to Chicago, NewYork and San Francisco
-- Checking who in this three set flew in these flight
SELECT name, passport_number
FROM people
WHERE people.name IN ("Bruce", "Taylor", "Diana", "James", "Philip", "Robin")
AND passport_number IN (
    SELECT passport_number
    FROM passengers
    JOIN flights
    ON flights.id = passengers.flight_id
    JOIN airports
    ON airports.id = flights.origin_airport_id
    WHERE flights.month = 7 AND flights.day = 29 AND flights.hour BETWEEN 00 AND 12
    AND flights.origin_airport_id IN (
        SELECT airports.id
        FROM airports
        WHERE airports.city = "Fiftyville"
    )
    AND flights.destination_airport_id IN (
        SELECT airports.id
        FROM airports
        WHERE airports.city IN ("New York City", "Chicago", "San Francisco")
    )
);
-- Here Taylor and Bruce can be seen in one of the three flight
SELECT full_name, city, passport_number, flights.destination_airport_id, flights.hour, flights.minute
FROM airports
JOIN flights
ON flights.origin_airport_id = airports.id
JOIN passengers
ON passengers.flight_id = flights.id
WHERE flights.month = 7 AND flights.day = 29 AND hour BETWEEN 00 AND 12
AND passengers.passport_number IN (
    SELECT passport_number
    FROM people
    WHERE people.name IN ("Bruce", "Taylor", "James", "Robin")
);
-- Here both of them flew to airport is 4 aka New York
