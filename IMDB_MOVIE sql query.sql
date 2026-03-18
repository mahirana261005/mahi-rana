use project_movie_database;

select* from directors;
select* from movies;

-- 1. can you get all data about movies
select* from movies;

-- 2. how do you get all data about directors
select* from directors;

-- 3. check how many movies are present in imdb
select count(*) as total_movie
from movies;

-- 4. find these 3 director: james cameron; luc besson; john woo
select * from directors
where name in ('james cameron','luc besson','john woo');

-- 5. find all dicrectors with names starting with s 
select * from directors
where name like 's%';

-- 6. count female directors
select count(*) female_director
from directors
where gender = 1;

-- 7. find the name of the 10th first women directors
select name 
from directors
where gender = 1
order by id asc
limit 1 offset 9;

-- 8. what are the 3 most popular movies
select title, popularity,release_date
from movies
order by popularity desc
limit 3;

-- 9. what are the 3 most bankable movies
select title,revenue
from movies
order by revenue desc
limit 3;

-- 10. what is the most awarded avg vote since the jan 1st 2000
select vote_average, count(*) as count
from movies
where release_date >= '2000-01-01'
group by vote_average
order by count desc
limit 1;

-- 11. which movies were directed by brenda chapman
select m.title
from movies m 
join directors d 
on d.id = m.director_id
where d.name = 'brenda chapman';

-- 12. which director made the most movies
select d.name,count(m.id) as movie_count
from directors d 
join movies m 
on d.id = m.director_id
group by d.name
order by movie_count desc
limit 1;

-- 13. which director is the most bankable 
select d.name,sum(m.revenue) as total_revenue,count(m.id) as movie_count
from directors d 
join movies m 
on d.id = m.director_id 
group by d.name
order by total_revenue desc
limit 1;