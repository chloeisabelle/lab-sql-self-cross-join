-- 1. Get all pairs of actors that worked together.

select r1.actor_id as actor1, r2.actor_id as actor2,
count(r1.film_id) as Cast_Together
from film_actor r1 inner join film_actor r2 on r1.film_id = r2.film_id
and r1.actor_id > r2.actor_id
group by r1.actor_id, r2.actor_id
order by Cast_Together desc;



-- 2. Get all pairs of customers that have rented the same film more than 3 times.

select * from sakila.customer d1
join sakila.rental d2
on d1.customer_id = d2.customer_id
where d1.active > 0;


-- 3. Get all possible pairs of actors and films.


select distinct film_id from sakila.film;
select distinct actor_id from sakila.film_actor;

select * from (
	select distinct film_id from sakila.film
) sub1
cross join (
	select distinct actor_id from sakila.film_actor
) sub2;