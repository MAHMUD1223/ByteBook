SELECT DISTINCT name
FROM people, movies, directors, ratings
WHERE directors.movie_id=movies.id
AND ratings.movie_id=movies.id
AND directors.person_id=people.id
AND rating>=9;
