-- Goodreads Platform Analysis


-- Rating Distribution

SELECT rating_category,
       COUNT(*) AS book_count,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 1) AS pct
FROM books
WHERE rating_category IS NOT NULL
GROUP BY rating_category
ORDER BY book_count DESC;


-- Popularity vs Rating

SELECT estimated_popularity,
       COUNT(*) AS books,
       ROUND(AVG(rating)::numeric, 3) AS avg_rating,
       ROUND(MIN(rating)::numeric, 2) AS min_r,
       ROUND(MAX(rating)::numeric, 2) AS max_r
FROM books
GROUP BY estimated_popularity
ORDER BY avg_rating DESC;


-- Series by Rank

SELECT
  CASE
    WHEN rank <= 500  THEN 'Top 500'
    WHEN rank <= 1000 THEN '501-1000'
    WHEN rank <= 2000 THEN '1001-2000'
    ELSE 'Bottom 1045'
  END AS rank_bucket,
  ROUND(AVG(has_series_info::int)::numeric * 100, 1) AS series_pct,
  COUNT(*) AS books
FROM books
GROUP BY rank_bucket
ORDER BY MIN(rank);


-- Title Complexity

SELECT title_complexity,
       ROUND(AVG(rating)::numeric, 3) AS avg_rating,
       COUNT(*) AS books
FROM books
GROUP BY title_complexity
ORDER BY avg_rating DESC;


-- Tier Distribution

SELECT rating_tier,
       COUNT(*) AS books,
       ROUND(AVG(rating)::numeric, 3) AS avg_rating,
       ROUND(MIN(rating)::numeric, 2) AS min_r,
       ROUND(MAX(rating)::numeric, 2) AS max_r
FROM books
GROUP BY rating_tier
ORDER BY rating_tier;
