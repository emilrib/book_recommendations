# Selecting the 10 most common Genres
SELECT
  GenreID,
  COUNT(GenreID) AS `value_occurrence` 
FROM
  book_genres
GROUP BY 
  GenreID
ORDER BY 
  `value_occurrence` DESC
LIMIT 20;

#Top 10
SELECT * FROM genres WHERE GenreID IN (2, 6, 4, 1, 42, 114, 26, 21, 56, 17);
#Top 10-20
SELECT * FROM genres WHERE GenreID IN (13, 15, 7, 20, 28, 19, 5, 12, 57, 11);