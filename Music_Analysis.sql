SELECT * FROM album

--Q1 who is the senier most employee based on job title 
select * from employee
ORDER BY levels desc
limit 1

--q2 which countries have the most Invoices 
select * from invoice  

select COUNT(*) as c, billing_country
from invoice
GROUP BY billing_country
order by c desc

--Q3 what are top 3 values of total invoices 
select total from invoice 
order by total desc
limit 3

--Q4 Which City has best cutomer? we would like to throw a professional Music festival the city 
-- we made the most money. write query that return one city that has the higheat sum of invoice 
--   total Return both the city name and sum of all invoic total 

select SUM(total) as invoice_total, billing_city
from invoice
group by billing_city 
order by invoice_total desc

--who is the best customer ? the customer who has spent the most money will be decleared 
-- the best customer 
-- write a  query that return the person who has spnt the most money 

select customer.customer_id,customer.first_name,customer.last_name ,SUM(invoice.total) AS total
from customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC
limit 1

SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name  LIKE 'Rock'
GROUP BY   artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;

