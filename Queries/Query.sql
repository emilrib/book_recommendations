Select * from bookdb.awards;

Select * from bookdb.bc_user_ratings;

Select Round(AVG(COUNT(RATING)),0) from bookdb.bc_user_ratings;

Select * from bookdb.bc_user_ratings;

Select count(*) from bookdb.bc_users;

Select count(BookID) from bookdb.book_awards
where BookID = 1;

Select count('Audiobook') from bookdb.books;
Select count(*) from bookdb.book_genres 
where GenreID = 13;
select * from bookdb.genres;


Select * from bookdb.genres;
Select * from bookdb.book_genres;

SELECT COUNT(BookID) as Number_of_awards
FROM bookdb.book_awards
GROUP BY BookID;

SELECT 
bg.GenreID AS GenreID
,gen.Name AS Genre
,us.UserID As UserID
,us.Age AS User_age
,book.Pages AS Number_pages
,us.Country AS Country_user
,rat.RATING AS Ratings 
,book.BookFormat As Book_format
#,awards.Name AS Awards
,book.BookID AS BookID 
,book.Title AS Title
#,book.Series_Name AS Book_Series
,book.Author AS Author
,book.Rating_GR AS Rating_GR 
,book.Language AS Book_language
#,book.ISBN AS ISBN 
,book.Publisher AS Publisher 
#,book.likedPercent AS Percentage_likes 
#,book.price AS Price
,COUNT(ba.BookID) as Number_of_awards
From bookdb.books book
INNER JOIN bookdb.book_genres bg 
ON book.BookID = bg.BookID
INNER JOIN bookdb.genres gen 
ON bg.GenreID = gen.GenreID
INNER JOIN bookdb.bc_user_ratings rat 
ON book.BookID = rat.BookID
LEFT JOIN bookdb.bc_users us
ON rat.UserID = us.UserID
LEFT JOIN bookdb.book_awards ba
on book.BookID = ba.BookID
LEFT JOIN bookdb.awards awards
on ba.AwardID = awards.AwardID
WHERE bg.GenreID IN (2, 6, 4, 1, 42, 114, 26, 20, 21, 56, 17,15,7,19,28,5,12)
and rat.RATING <> 0
AND us.Age <> 0
Group by 
bg.GenreID 
,gen.Name 
,us.Age 
,us.Country 
,rat.RATING
,us.UserID
#,awards.Name  
,book.BookID  
,book.Title 
,book.Pages 
,book.BookFormat
#,book.Series_Name 
,book.Author 
,book.Rating_GR  
,book.Language 
#,book.ISBN  
,book.Publisher;  

#,book.likedPercent  
#,book.price;



##check for the top 17 values
SELECT
  GenreID as gen
  ,Name as nem
	,COUNT(GenreID) AS `value_occurrence` 
FROM
  bookdb.book_genres 
GROUP BY 
  GenreID
  ,Name
ORDER BY 
  `value_occurrence` DESC
LIMIT 20;

SELECT
  genr.GenreID
  ,ge.Name
  ,COUNT(genr.GenreID) AS `value_occurrence` 
FROM bookdb.book_genres genr
left join bookdb.genres ge
on genr.GenreID = ge.GenreID
GROUP BY 
  genr.GenreID
  ,ge.Name
ORDER BY 
 `value_occurrence` DESC
LIMIT 18;



GenreID IN (2, 6, 4, 1, 42, 114, 26, 21, 56, 17);
Select * from 
bookdb.book_genres;
Select * from bookdb.genres;

SELECT 
count(*)
From bookdb.books book
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
LEFT JOIN bookdb.awards awards
on ba.AwardID = awards.AwardID;
  
SELECT 
count(*)
From bookdb.books book
Inner JOIN bookdb.book_genres bg 
ON book.BookID = bg.BookID
Inner JOIN bookdb.genres gen 
ON bg.GenreID = gen.GenreID;

LEFT JOIN bookdb.bc_user_ratings rat 
ON book.BookID = rat.BookID;
#LEFT JOIN bookdb.bc_users us
#ON rat.UserID = us.UserID
#LEFT JOIN bookdb.book_awards ba
#on book.BookID = ba.BookID;
#LEFT JOIN bookdb.awards awards
#on ba.AwardID = awards.AwardID;
##410228


SELECT 
count(*)
From bookdb.books book
LEFT JOIN bookdb.bc_user_ratings rat 
ON book.BookID = rat.BookID;



SELECT book.BookID, COUNT(*) 
FROM bookdb.books book
LEFT JOIN bookdb.bc_user_ratings rat 
ON book.BookID = rat.BookID
GROUP BY book.BookID
HAVING COUNT(*) > 0;