SELECT title
FROM people, movies, stars, ratings
WHERE stars.movie_id=movies.id
AND stars.person_id=people.id
AND ratings.movie_id=movies.id
AND people.name='Chadwick Boseman'
ORDER BY rating DESC
LIMIT 5;
