#calculate the top 16 genres    
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

#Final Query
#unoptimized version

SELECT 
bg.GenreID AS GenreID
,gen.Name AS Genre
,us.UserID As UserID
,us.Age AS User_age
,rat.RATING AS Ratings 
,book.BookFormat As Book_format
,book.BookID AS BookID 
,book.Title AS Title
,book.Author AS Author
,book.Publisher AS Publisher 
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
,us.UserID 
,us.Age 
,rat.RATING 
,book.BookFormat 
,book.BookID  
,book.Title 
,book.Author 
,book.Publisher;    
        

#optimized version
#added indexes to speed up query

CREATE INDEX idx_books_bookid ON bookdb.books(BookID);
CREATE INDEX idx_book_genres_bookid ON bookdb.book_genres(BookID);
CREATE INDEX idx_genres_genreid ON bookdb.genres(GenreID);
CREATE INDEX idx_bc_users_userid ON bookdb.bc_users(UserID);
CREATE INDEX idx_us_age ON bookdb.bc_users (Age);
CREATE INDEX idx_rat_rating ON bookdb.bc_user_ratings (RATING);

SELECT
    bg.GenreID AS GenreID
    ,gen.Name AS Genre
    ,us.UserID AS UserID
    ,us.Age AS User_age
    ,rat.RATING AS Ratings
    ,(SELECT COUNT(*) FROM bookdb.book_awards ba WHERE book.BookID = ba.BookID) AS Number_of_awards
    ,book.BookID AS BookID
    ,book.Title AS Title
    ,book.Author AS Author
    ,book.BookFormat AS Book_format
    ,book.Publisher AS Publisher
FROM
    bookdb.books book
    INNER JOIN bookdb.book_genres bg ON book.BookID = bg.BookID
    INNER JOIN bookdb.genres gen ON bg.GenreID = gen.GenreID
    LEFT JOIN bookdb.bc_user_ratings rat ON book.BookID = rat.BookID
    LEFT JOIN bookdb.bc_users us ON rat.UserID = us.UserID
WHERE
    us.Age <> 0
    AND rat.RATING <> 0
    AND bg.GenreID IN (2, 6, 4, 1, 42, 114, 26, 20, 21, 56, 17, 15, 7, 19, 28, 5, 12)
GROUP BY
	bg.GenreID
	,us.UserID
	,book.BookID;
    
    


    


    
    
