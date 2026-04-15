/*
a) actor_id, first_name, last_name, and last_update
b) film_id, title, description, release_year, lamguage_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features, and last_update
c) film_actor contains actor_id and film_id
d) rental id, inventory id, customer id, rental date, return date. staff id, and last update can be found. This information is easy to understand because it shows the id of not only the customer, but the staff memeber that completed the transaction at the time along with the date of the rental, the return date, and the last update of the information. 
e) This table includes the inventory id, the film id, store id, and the last update as well. 
f) The tables needed would be the film id, the title, the date of rental, and the return date because this information helps the store to keep track of what was rented and what films we may have in stock that a customer has requested, the date of when a film was returned, and the date of when the film was rented as well. 
*/

SELECT * FROM film;
SELECT * FROM title;
SELECT * FROM rental_duration;
