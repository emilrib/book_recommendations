Select * from bookdb.awards;

Select * from bookdb.bc_user_ratings;
Select Round(AVG(COUNT(RATING)),0) from bookdb.bc_user_ratings;

Select distinct Rating from bookdb.bc_user_ratings
order by Rating ASC;
Select * from bookdb.bc_users;

Select * from bookdb.book_awards;




Select * from bookdb.books;

Select distinct Name from bookdb.genres;


SELECT 
bg.GenreID AS GenreID
,gen.Name AS Genre
,us.Age AS User_age
,us.Country AS Country_user
,rat.RATING AS Ratings 
,awards.Name AS Awards
,book.BookID AS BookID 
,book.Title AS Title
,book.Series_Name AS Book_Series
,book.Author AS Author
,book.Rating_GR AS Rating_GR 
,book.Language AS Book_language
,book.ISBN AS ISBN 
,book.Publisher AS Publisher 
,book.likedPercent AS Percentage_likes 
,book.price AS Price
##,Round(AVG(RATING),0) AS Average_Rating; Calculation can be done in the visualization tool
FROM bookdb.books book
INNER JOIN bookdb.book_genres bg 
ON book.BookID = bg.BookID
INNER JOIN bookdb.genres gen 
ON bg.GenreID = gen.GenreID
LEFT JOIN bookdb.bc_user_ratings rat 
ON book.BookID = rat.BookID
LEFT JOIN bookdb.bc_users us
ON rat.UserID = us.UserID
LEFT JOIN bookdb.book_awards ba
on book.BookID = ba.BookID
inner JOIN bookdb.awards awards
on ba.AwardID = awards.AwardID
WHERE bg.GenreID IN (2, 6, 4, 1, 42, 114, 26, 21, 56, 17)
AND us.Age <> 0
Group by 
bg.GenreID 
,gen.Name 
,us.Age 
,us.Country 
,rat.RATING
,awards.Name  
,book.BookID  
,book.Title 
,book.Series_Name 
,book.Author 
,book.Rating_GR  
,book.Language 
,book.ISBN  
,book.Publisher  
,book.likedPercent  
,book.price;




SELECT
  GenreID,
  COUNT(GenreID) AS `value_occurrence` 
FROM
  bookdb.book_genres
GROUP BY 
  GenreID
ORDER BY 
  `value_occurrence` DESC
LIMIT 10;

GenreID IN (2, 6, 4, 1, 42, 114, 26, 21, 56, 17);
Select * from 
bookdb.book_genres;

