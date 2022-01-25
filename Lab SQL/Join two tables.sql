-- Q1 Which actor has appeared in the most films?
USE sakila; 
-- Find out which actor has the most appearances in all the films
select actor_id from film_actor
group by actor_id
order by count(film_id) desc
limit 1;
-- Found out which actor corresponds to the id
Select first_name, last_name from actor
where actor_id = 107;

-- Joining tables method
-- select * from film_actor as most_films
-- inner join actor as l on
-- most_films.actor_id = l.actor_id
-- order by count(film_id) desc
select a.actor_id, a.first_name, a.last_name, count(*) as most_films from actor as a
inner join film_actor as b on 
a.actor_id = b.actor_id
group by a.actor_id
order by most_films desc;
--------------------------

select a.actor_id, a.first_name, a.last_name, count(*) as n_films from sakila.actor as a
join sakila.film_actor as f_a
using(actor_id)
group by a.actor_id
order by n_films desc
limit 1;

-- Q2 Most active customer (the customer that has rented the most number of films)

/* SELECT customer_id, count(rental_id) from rental
group by customer_id
order by count(rental_id) desc
limit 1;*/

select a.customer_id, a.first_name, a.last_name, count(*) as n_films from .actor as a
join .film_actor as f_a
using(customer_id)
group by a.actor_id
order by n_films desc
limit 1;

--  Q3 List number of films per category
/* SELECT customer_id, count(rental_id) from rental
group by customer_id
order by count(rental_id) desc
limit 1;*/

select a.category_id, a.name, count(*) as n_category from category as a
join film_category as f_C
using (category_id)
group by a.category_id;

-- Q4 Display the first and last names, as well as the address, of each staff member.
select a.first_name, a.last_name, a.address_id, b.address from staff as a
join address as b
using (address_id);


-- 	q5	Display the total amount rung up by each staff member in August of 2005
select a.staff_id, a.first_name,a.last_name, sum(b.amount) as tot_amount from staff as a
join payment as b
using (staff_id)
-- write the date as str. w/ where and
where b.payment_date >= '20050801' and b.payment_date <= '20050831'
group by a.staff_id;

-- q6 List each film and the number of actors who are listed for that film.
select a.film_id, a.title, count(b.actor_id) as n_actors from film as a
join film_actor as b
using(film_id)
group by a.film_id
-- ! Problem with film_id= 1 