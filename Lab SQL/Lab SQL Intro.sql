SELECT * from sakila.actor;
select * from sakila.address;
select * from sakila.category;
select * from sakila.city;
select * from sakila.customer;
select * from sakila.film;
select * from sakila.film_actor;
select * from sakila.film_category;
select * from sakila.film_text;
select * from sakila.inventory;
select * from sakila.language;
select * from sakila.payment;
select * from sakila.rental;
select * from sakila.staff;
select * from sakila.store;

-- 3 Select the titles from the films
select title from sakila.film;
select film_id, title from sakila.film;

-- select and alias
select * from sakila.language;
select name  as language from sakila.language;
-- BONUS: to obtain the language per each film, but this is a good time to think about how you might get that information in the future.

-- 5-1 how many stores the company has
select * from sakila.store;
select * from sakila.address;
-- how many unique addresses: 2
select count(store_id) from sakila.address;

-- how many employees?
select count(staff_id) from sakila.staff;

-- 5.3 Return a list of employee first names only?
select first_name as "employee's first name" from sakila.staff
			



 


