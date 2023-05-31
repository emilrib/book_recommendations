#Final Query
    
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
    ,gen.Name 
    ,us.UserID 
    ,us.Age 
    ,rat.RATING 
    ,book.BookID
    ,book.Title 
    ,book.Author 
    ,book.BookFormat
    ,book.Publisher;
    

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
    
    
