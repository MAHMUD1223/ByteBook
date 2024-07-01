SELECT p2.name
FROM people p1, people p2, stars s1, stars s2, movies
WHERE p1.id = s1.person_id
AND p2.id = s2.person_id
AND movies.id = s1.movie_id
AND movies.id = s2.movie_id
AND p1.name = 'Kevin Bacon'
AND p1.birth = 1958
AND p2.name != 'Kevin Bacon';
