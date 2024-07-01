SELECT title
FROM people p1, people p2, movies, stars s1, stars s2
WHERE s1.movie_id=movies.id
AND s2.movie_id=movies.id
AND s1.person_id=p1.id
AND s2.person_id=p2.id
AND p1.name='Bradley Cooper'
AND p2.name='Jennifer Lawrence';
