#Optimized Query 2
#Reordered columns and joins
#Reduced group by
#reordered filtering statements
SELECT 
	bg.GenreID AS GenreID
	,gen.Name AS Genre
	,us.UserID As UserID
    ,us.Country AS Country_user
	,us.Age AS User_age
    ,rat.RATING AS Ratings 
	,COUNT(ba.BookID) as Number_of_awards
	,book.BookID AS BookID 
	,book.Title AS Title
	,book.Author AS Author
	,book.Rating_GR AS Rating_GR 
	,book.Language AS Book_language
	,book.BookFormat As Book_format
	,book.Pages AS Number_pages
	,book.Publisher AS Publisher 
From bookdb.books book
INNER JOIN bookdb.book_genres bg ON book.BookID = bg.BookID
INNER JOIN bookdb.genres gen ON bg.GenreID = gen.GenreID
INNER JOIN bookdb.bc_user_ratings rat ON book.BookID = rat.BookID
LEFT JOIN bookdb.bc_users us ON rat.UserID = us.UserID
LEFT JOIN bookdb.book_awards ba on book.BookID = ba.BookID
LEFT JOIN bookdb.awards awards on ba.AwardID = awards.AwardID
WHERE us.Age <> 0
AND rat.RATING <> 0
AND bg.GenreID IN (2, 6, 4, 1, 42, 114, 26, 20, 21, 56, 17,15,7,19,28,5,12)
Group by 
	bg.GenreID
	,gen.Name
	,us.UserID
    ,us.Country
	,us.Age
    ,rat.RATING
	,book.BookID;

#Query 3
#added a subquery for awards instead of join
SELECT
	bg.GenreID AS GenreID
	,gen.Name AS Genre
	,us.UserID As UserID
	,us.Country AS Country_user
	,us.Age AS User_age
	,rat.RATING AS Ratings
	,(SELECT COUNT(*) FROM bookdb.book_awards ba WHERE book.BookID = ba.BookID) as Number_of_awards
	,book.BookID AS BookID
	,book.Title AS Title
	,book.Author AS Author
	,book.Rating_GR AS Rating_GR
	,book.Language AS Book_language
	,book.BookFormat As Book_format
	,book.Pages AS Number_pages
	,book.Publisher AS Publisher
FROM bookdb.books book
INNER JOIN bookdb.book_genres bg ON book.BookID = bg.BookID
INNER JOIN bookdb.genres gen ON bg.GenreID = gen.GenreID
INNER JOIN bookdb.bc_user_ratings rat ON book.BookID = rat.BookID
LEFT JOIN bookdb.bc_users us ON rat.UserID = us.UserID
WHERE us.Age <> 0
AND rat.RATING <> 0
AND bg.GenreID IN (2, 6, 4, 1, 42, 114, 26, 20, 21, 56, 17,15,7,19,28,5,12)
GROUP BY
	bg.GenreID
	,gen.Name
	,us.UserID
	,us.Country
	,us.Age
	,rat.RATING
	,book.BookID;
    
#Query 4
#added indexes to speed up query

CREATE INDEX idx_books_bookid ON bookdb.books(BookID);
#DROP INDEX idx_books_bookid ON bookdb.books;
CREATE INDEX idx_book_genres_bookid ON bookdb.book_genres(BookID);
#DROP INDEX idx_book_genres_bookid ON bookdb.book_genres;
CREATE INDEX idx_book_genres_genreid ON bookdb.book_genres(GenreID);
#DROP INDEX idx_book_genres_genreid ON bookdb.book_genres;
CREATE INDEX idx_genres_genreid ON bookdb.genres(GenreID);
#DROP INDEX idx_genres_genreid ON bookdb.genres;
CREATE INDEX idx_bc_user_ratings_bookid ON bookdb.bc_user_ratings(BookID);
#DROP INDEX idx_bc_user_ratings_bookid ON bookdb.bc_user_ratings;
CREATE INDEX idx_bc_users_userid ON bookdb.bc_users(UserID);
#DROP INDEX idx_bc_users_userid ON bookdb.bc_users;

SELECT
	bg.GenreID AS GenreID
	,gen.Name AS Genre
	,us.UserID As UserID
	,us.Country AS Country_user
	,us.Age AS User_age
	,rat.RATING AS Ratings
	,(SELECT COUNT(*) FROM bookdb.book_awards ba WHERE book.BookID = ba.BookID) as Number_of_awards
	,book.BookID AS BookID
	,book.Title AS Title
	,book.Author AS Author
	,book.Rating_GR AS Rating_GR
	,book.Language AS Book_language
	,book.BookFormat As Book_format
	,book.Pages AS Number_pages
	,book.Publisher AS Publisher
FROM bookdb.books book
INNER JOIN bookdb.book_genres bg ON book.BookID = bg.BookID
INNER JOIN bookdb.genres gen ON bg.GenreID = gen.GenreID
INNER JOIN bookdb.bc_user_ratings rat ON book.BookID = rat.BookID
LEFT JOIN bookdb.bc_users us ON rat.UserID = us.UserID
WHERE us.Age <> 0
AND rat.RATING <> 0
AND bg.GenreID IN (2, 6, 4, 1, 42, 114, 26, 20, 21, 56, 17,15,7,19,28,5,12)
GROUP BY
	bg.GenreID
	,gen.Name
	,us.UserID
	,us.Country
	,us.Age
	,rat.RATING
	,book.BookID;
