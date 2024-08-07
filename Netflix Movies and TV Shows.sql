-- 14:- Identify the country with the most TV shows released after the year 2000,
--      and list the top 5 TV shows from that country by rating.
WITH CountryCounts AS (
  SELECT country, COUNT(*) AS show_count
  FROM netflix_titles
  WHERE release_year > 2000
  GROUP BY country
  ORDER BY show_count DESC limit 1)
SELECT t.title,t.country, t.rating
FROM netflix_titles t
INNER JOIN CountryCounts c ON t.country = c.country
ORDER BY t.rating DESC limit 5;


