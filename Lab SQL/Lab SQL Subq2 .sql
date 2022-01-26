-- 1 How many copies of the film Hunchback Impossible exist in the inventory system?
-- 2 List all films whose length is longer than the average of all the films.
-- 3 Use subqueries to display all actors who appear in the film Alone Trip.
-- 4 Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
-- 5 Get name and email from customers from Canada using subqueries. 
-- 	Do the same with joins. 
-- Note that to create a join, you will have to identify the correct tables 
-- with their primary keys and foreign keys, 
-- that will help you get the relevant information.

use sakila;

-- Q1
select film_id from film
where title= 'Hunchback Impossible';

select count(inventory_id)from inventory
where film_id=(select film_id from film
where title ='Hunchback Impossible')
group by film_id;

-- Q2 List all films whose length is longer than the average of all the films.
select title, length from film
where length >(select avg(length) from film);

-- Q3 Use subqueries to display all actors who appear in the film Alone Trip.
select first_name, last_name from actor
where actor_id in (SELECT actor_id FROM film_actor
where film_id = (select film_id from film where title = 'Alone Trip'));



-- Q4 Sales have been lagging among young families, 
-- and you wish to target all family movies for a promotion.
-- Identify all movies categorized as family films.
select title, film_id from film
where film_id in ( select film_id from film_category
where category_id=(select category_id from category where `name` = 'Family'));

-- Q5 Get name and email from customers from Canada using subqueries.
-- Do the same with joins
SELECT first_name, last_name, email from customer
where address_id in
(SELECT address_id FROM address
where city_id in
(SELECT city_id FROM city
where country_id = (SELECT country_id FROM country
where country= "Canada")));

-- 5.b
select first_name,last_name, email from customer
JOIN address
on customer.address_id = address.address_id
Join city
on city.city_id= address.city_id
join country
on country.country_id = city.country_id
where country = "Canada"





