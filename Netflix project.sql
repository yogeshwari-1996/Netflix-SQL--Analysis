Create Database Netflix_DB;

### Creating Table ###

use Netflix_DB;
CREATE TABLE netflix (
    show_id VARCHAR(10),
    type VARCHAR(20),
    title TEXT,
    director TEXT,
    cast TEXT,
    country TEXT,
    date_added DATE,
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(20),
    listed_in TEXT,
    description text 
    );
    
    
    -- Check null values
SELECT * FROM netflix
WHERE director IS NULL OR country IS NULL;

-- Replace nulls
UPDATE netflix
SET director = 'Unknown'
WHERE director IS NULL;

UPDATE netflix
SET date_added = STR_TO_DATE(date_added, '%M %d, %Y');

-- Total records
SELECT COUNT(*) FROM netflix;

-- Count Movies vs TV Shows
SELECT type, COUNT(*) 
FROM netflix
GROUP BY type;

--Most common ratings ---
select rating, count(*)
from netflix
group by rating
order by count(*) desc;

--Top 10 Countries producing content --

select country, count(*) as total
from netflix
group by country 
order by total desc
limit 10;

--- content added each year --
select year(date_added) as year, count(*)
from netflix
group by year
order by year;

-- Longest movie
select title,  duration
from netflix
where type= 'movie'
order by duration desc
limit 1;


---- Find directors with most content

select director, count(*) as total 
from netflix
group by director 
order by total desc
limit 10;


---- Genre analysis----
SELECT listed_in, COUNT(*) AS total
FROM netflix
GROUP BY listed_in
ORDER BY total DESC;

-- Content trends over year ----
select release_year, count(*)
from netflix
group by release_year
order by release_year;