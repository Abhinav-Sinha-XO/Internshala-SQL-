create database new;

select * from table1;


alter table table1 rename to track;
-- Module 4 Assignment
-- A.Optimizing Music Database Queries for Enhanced Data Analysis

-- 1 -----
select t.name as Trackname, g.name as Genrename
from track t
inner join genre g on t.genreId = g.genreId

-- 2 -----

select t.name as trackname, g.name as genrename
from track t
left join genre g on t.genreId = g.genreId;

SELECT g.Name AS GenreName, t.Name AS TrackName
FROM genre g
LEFT JOIN track t ON g.GenreId = t.GenreId;

SELECT t.Name AS TrackName, g.Name AS GenreName
FROM track t
CROSS JOIN genre g;


SELECT Name AS TrackName
FROM track
WHERE Milliseconds > 300000
UNION
SELECT Name AS TrackName
FROM track
WHERE UnitPrice > 0.99;

SELECT Name AS TrackName
FROM track
WHERE Milliseconds > 300000
UNION ALL
SELECT Name AS TrackName
FROM track
WHERE UnitPrice > 0.99;

SELECT t.Name AS TrackName
FROM track t
JOIN genre g ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock';


select g.name as genrename, count(t.trackId) as trackcount
from genre g
Left join track t on g.genreid = t.trackid
group by g.name;

SELECT g.Name AS GenreName
FROM genre g
LEFT JOIN track t ON g.GenreId = t.GenreId
WHERE t.TrackId IS NULL;


SELECT t.Name AS TrackName, g.Name AS GenreName
FROM track t
CROSS JOIN genre g
LEFT JOIN track t2 ON g.GenreId = t2.GenreId
WHERE t2.TrackId IS NULL; 

SELECT t.Name AS TrackName, g.Name AS GenreName
FROM track t 
CROSS JOIN genre g
LEFT JOIN track t2 ON g.GenreId = t2.GenreId
WHERE t2.TrackId IS NULL;


-- B -----------\

create database B;

use B;

SELECT first_name, last_name, fare
FROM titanic
WHERE fare > (SELECT AVG(fare) FROM Titanic);


SELECT first_name, last_name, pclass
FROM Titanic
WHERE pclass = (SELECT pclass FROM Titanic 
WHERE first_name = 'Julia' AND last_name = 'Patel');

SELECT first_name, last_name, embark_town
FROM Titanic
WHERE 
embark_town = 
(SELECT embark_town FROM Titanic GROUP BY embark_town ORDER BY COUNT(*) DESC LIMIT 1);

SELECT first_name, last_name, age
FROM Titanic
WHERE survived = 1 AND age < (SELECT AVG(age) FROM Titanic);

SELECT first_name, last_name, fare
FROM Titanic
ORDER BY fare DESC
LIMIT 10;


SELECT first_name, last_name, pclass
FROM Titanic
WHERE pclass IN (
    SELECT pclass
    FROM Titanic
    GROUP BY pclass
    HAVING AVG(survived) > (SELECT AVG(survived) FROM Titanic)
);



SELECT first_name, last_name, fare, deck
FROM Titanic
WHERE deck = (
    SELECT deck
    FROM Titanic
    GROUP BY deck
    ORDER BY AVG(fare) ASC
    LIMIT 1
);

SELECT first_name, last_name, fare, pclass
FROM Titanic t1
WHERE fare > (
    SELECT AVG(fare)
    FROM Titanic t2
    WHERE t1.pclass = t2.pclass
)

SELECT first_name, last_name, deck
FROM Titanic
WHERE deck = (
    SELECT deck
    FROM Titanic
    GROUP BY deck
    ORDER BY COUNT(*) DESC
    LIMIT 1
);



-- C -----------------------//
create database C;
use C;

SELECT Passenger_No,
       first_name,
       last_name,
       pclass,
       LEAD(Passenger_No) OVER (PARTITION BY pclass ORDER BY Passenger_No) AS next_passenger_id
FROM Titanic;

SELECT Passenger_No,
       first_name,
       last_name,
       pclass,
       fare,
       LAG(fare) OVER (PARTITION BY pclass ORDER BY Passenger_No) AS previous_fare
FROM Titanic;

SELECT Passenger_No,
       first_name,
       last_name,
       pclass,
       fare,
       RANK() OVER (PARTITION BY pclass ORDER BY fare DESC) AS fare_rank
FROM Titanic;


SELECT Passenger_No,
       first_name,
       last_name,
       pclass,
       age,
       DENSE_RANK() OVER (PARTITION BY pclass ORDER BY age) AS age_dense_rank
FROM Titanic;


SELECT Passenger_No,
       first_name,
       last_name,
       embark_town,
       ROW_NUMBER() OVER (PARTITION BY embark_town ORDER BY Passenger_No) AS row_num
FROM Titanic;


SELECT Passenger_No,
       first_name,
       last_name,
       pclass,
       sex,
       LEAD(Passenger_No) OVER (PARTITION BY pclass ORDER BY Passenger_No) AS next_female_passenger_id
FROM Titanic
WHERE sex = 'female';               

SELECT Passenger_No,
       first_name,
       last_name,
       pclass,
       age,
       LAG(age) OVER (PARTITION BY pclass ORDER BY Passenger_No) AS previous_age
FROM Titanic
WHERE sex = 'male';                                 



SELECT Passenger_No,
       first_name,
       last_name,
       pclass,
       fare,
       RANK() OVER (PARTITION BY pclass ORDER BY fare DESC) AS female_fare_rank
FROM Titanic
WHERE sex = 'female';                                                                                                          


SELECT Passenger_No,
first_name,
last_name,
pclass,
age,
survived,
DENSE_RANK() OVER (PARTITION BY pclass ORDER BY age) AS survival_age_dense_rank
FROM Titanic
WHERE survived = 1;

SELECT Passenger_No,
       first_name,
       last_name,
       embark_town,
       ROW_NUMBER() OVER (PARTITION BY embark_town ORDER BY Passenger_No) AS row_num
FROM Titanic
WHERE embark_town = 'Southampton'; 














 














