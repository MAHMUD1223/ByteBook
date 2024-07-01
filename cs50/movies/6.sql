SELECT avg(rating) as Average FROM ratings, movies WHERE ratings.movie_id=movies.id AND year=2012;
