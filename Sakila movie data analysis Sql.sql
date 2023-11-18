use sakila;
-- Task 1
select concat(first_name,' ', last_name) as'Full Name' from actor;
select count(*) from actor;
-- Task 2 (i) &(ii)
select count(first_name) as Total_Count, first_name from actor group by first_name;
select first_name from actor group by first_name having count(first_name)=1;
SELECT COUNT(DISTINCT first_name) AS unique_first_names_count FROM actor;
-- Task 3 (i) & (ii)
select count(last_name) as Total_Count, last_name from actor group by last_name;
select last_name from actor group by last_name having count(last_name)=1;
SELECT COUNT(DISTINCT last_name) AS unique_last_names_count FROM actor;
-- Task 4 (i), (ii) & (iii)
select title as 'R rated movies' from film where rating= 'R';
select count(*) as R_rated_movies_count from film where rating= 'R';
select title as 'Movies not R rated' from film where rating<> 'R';
select count(*) as Not_R_rated_movies_count from film where rating<> 'R';
select title as 'Movies for children' from film where rating= 'PG-13'; -- Movies for children 13 are PG-13 rated movies
select count(*) as 'PG-13_rated_movies_count' from film where rating= 'PG-13';
-- Task 5(i),(ii)&(iii)
select * from film where replacement_cost<11 ;
select * from film where replacement_cost between 11 and 20 ;
select * from film order by replacement_cost desc;
-- Task 6
select f.title as 'Film', count(a.film_id) as 'Number of actor' from film f inner join film_actor a on f.film_id=a.film_id 
group by a.film_id order by count(a.film_id) desc limit 3;
-- Task 7
select title from film where title like 'Q%' or title like 'K%';
-- Task 8
select concat(first_name,'  ', last_name) as 'AGENT TRUMAN ACTORS' from film inner join film_actor using (film_id) inner join actor using (actor_id)
 where title = 'Agent Truman';
 -- Task 9
 select title as 'Family movies' from film inner join film_category using (film_id) inner join category using (category_id) where name ='Family';
 select count(*) from film inner join film_category using (film_id) inner join category using (category_id) where name ='Family';
 -- Task 10(i)(ii)
select rating, max(rental_rate) as 'Maximum rental', min(rental_rate) as 'Minimum rental', round(avg(rental_rate),2) as 'Average rental' from film
 group by rating order by avg(rental_rate) desc;
 select f.title, count(r.inventory_id) as Rental_frequency from film f inner join inventory i on f.film_id=i.film_id inner join rental r on i.inventory_id=r.inventory_id 
 group by f.title order by Rental_frequency desc;
 -- Task 11
 select name as 'Movie Category', round((avg(replacement_cost)-avg(rental_rate)),2) as Difference from category inner join film_category 
 using (category_id) inner join film using (film_id) group by name having Difference>15;
 -- Task 12
 select name as 'Movie Category', count(title) Total_Count from category inner join film_category using (category_id) 
 inner join film using (film_id) group by name having Total_Count> 70;
 
 





