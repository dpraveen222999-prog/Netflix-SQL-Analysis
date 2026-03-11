-- NETFLIX SQL DATA ANALYSIS PROJECT
-- Dataset Table: netflix_titles

CREATE DATABASE netflix_analysis;

CREATE TABLE netflix_titles (
    show_id TEXT,
    type TEXT,
    title TEXT,
    director TEXT,
    castt TEXT,
    country TEXT,
    date_added TEXT,
    release_year INT,
    rating TEXT,
    duration TEXT,
    listed_in TEXT,
    description TEXT
);

select * from netflix_titles;

-- 1. Count Movies vs TV Shows
SELECT type, COUNT(*) AS total
FROM netflix_titles
GROUP BY type;


-- 2. Top 10 Countries Producing Netflix Content
SELECT country, COUNT(*) AS total_titles
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;


-- 3. Number of Titles Added Each Year
SELECT EXTRACT(YEAR FROM date_added::date) AS year_added,
       COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY year_added
ORDER BY year_added;


-- 4. Most Common Ratings
SELECT rating, COUNT(*) AS total
FROM netflix_titles
GROUP BY rating
ORDER BY total DESC;


-- 5. Top 10 Directors With Most Titles
SELECT director, COUNT(*) AS total_titles
FROM netflix_titles
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;


-- 6. Movies Released Each Year
SELECT release_year, COUNT(*) AS total_movies
FROM netflix_titles
WHERE type = 'Movie'
GROUP BY release_year
ORDER BY release_year;


-- 7. Rank Countries by Content Production (Window Function)
SELECT country,
       COUNT(*) AS total_titles,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS country_rank
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country;


-- 8. Top 5 Years With Most Content (Dense Rank)
SELECT release_year,
       COUNT(*) AS total_titles,
       DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_year
FROM netflix_titles
GROUP BY release_year
ORDER BY rank_year
LIMIT 5;


-- 9. Running Total of Content Released by Year
SELECT release_year,
       COUNT(*) AS yearly_titles,
       SUM(COUNT(*)) OVER (ORDER BY release_year) AS running_total
FROM netflix_titles
GROUP BY release_year;


-- 10. Previous Year vs Current Year Releases (LAG Function)
SELECT release_year,
       COUNT(*) AS titles_released,
       LAG(COUNT(*)) OVER (ORDER BY release_year) AS previous_year
FROM netflix_titles
GROUP BY release_year;


-- 11. Next Year Comparison (LEAD Function)
SELECT release_year,
       COUNT(*) AS titles_released,
       LEAD(COUNT(*)) OVER (ORDER BY release_year) AS next_year_titles
FROM netflix_titles
GROUP BY release_year;


-- 12. Longest Movie Duration
SELECT title, duration
FROM netflix_titles
WHERE type='Movie'
ORDER BY duration DESC
LIMIT 5;


-- 13. Movies vs TV Shows Per Year
SELECT release_year,
       type,
       COUNT(*) AS total
FROM netflix_titles
GROUP BY release_year, type
ORDER BY release_year;


-- 14. Percentage of Movies vs TV Shows
SELECT type,
       COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS percentage
FROM netflix_titles
GROUP BY type;


-- 15. Top Genres on Netflix
SELECT listed_in AS genre,
       COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY genre
ORDER BY total_titles DESC
LIMIT 10;
