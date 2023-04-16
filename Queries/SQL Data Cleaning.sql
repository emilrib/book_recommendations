##Understanding the data types in each table
#Books table
SELECT * FROM books;

SELECT DISTINCT Rating_GR
FROM books;

SELECT MAX(LENGTH(NumRatings_GR)) AS max_length
FROM books;

SELECT MAX(LENGTH(RatingsByStars_GR)) AS max_length
FROM books;

SELECT MAX(LENGTH(BBEScore)) AS max_length
FROM books;

SELECT MAX(LENGTH(BBEVotes)) AS max_length
FROM books;

SELECT MAX(LENGTH(Price)) AS max_length
FROM books;

SELECT MAX(Price)
FROM books;

#Price contains dates that need to be switched to null
#If data does not load into current table, set price data type to VARCHAR and then run this code. Price can be switched back to decimal after
UPDATE books
SET Price = CASE 
    WHEN Price LIKE '%September%' THEN Price = NULL
    ELSE Price
END;
UPDATE books
SET Price = CASE 
    WHEN Price LIKE '%October%' THEN Price = NULL
    ELSE Price
END;
UPDATE books
SET Price = CASE 
    WHEN Price LIKE '%November%' THEN Price = NULL
    ELSE Price
END;
UPDATE books
SET Price = CASE 
    WHEN Price LIKE '%May%' THEN Price = NULL
    ELSE Price
END;
UPDATE books
SET Price = CASE 
    WHEN Price LIKE '%March%' THEN Price = NULL
    ELSE Price
END;
UPDATE books
SET Price = CASE 
    WHEN Price LIKE '%June%' THEN Price = NULL
    ELSE Price
END;
UPDATE books
SET Price = CASE 
    WHEN Price LIKE '%July%' THEN Price = NULL
    ELSE Price
END;
UPDATE books
SET Price = CASE 
    WHEN Price LIKE '%January%' THEN Price = NULL
    ELSE Price
END;
UPDATE books
SET Price = CASE 
    WHEN Price LIKE '%February%' THEN Price = NULL
    ELSE Price
END;
UPDATE books
SET Price = CASE 
    WHEN Price LIKE '%December%' THEN Price = NULL
    ELSE Price
END;
UPDATE books
SET Price = CASE 
    WHEN Price LIKE '%August%' THEN Price = NULL
    ELSE Price
END;
UPDATE books
SET Price = CASE 
    WHEN Price LIKE '%April%' THEN Price = NULL
    ELSE Price
END;

SELECT MAX(Price)
FROM books;

SELECT MAX(Title)
FROM books;
SELECT MAX(LENGTH(Title)) AS max_length
FROM books;

SELECT MAX(LENGTH(Series_Name)) AS max_length
FROM books;

SELECT MAX(LENGTH(Author)) AS max_length
FROM books;
SELECT MAX(Author)
FROM books;

SELECT MAX(LENGTH(BookID)) AS max_length
FROM books;

SELECT MAX(LENGTH(Language)) AS max_length
FROM books;
SELECT MAX(Language)
FROM books;
SELECT BookID, Language
FROM books
WHERE Language Like '%Zwitserland%';
UPDATE books
SET Language = 'Dutch'
WHERE BookID = '15728668';

SELECT MAX(Language)
FROM books;
SELECT BookID, Language
FROM books
WHERE Language Like '%Zwischen%';
UPDATE books
SET Language = 'German'
WHERE Language LIKE '%Zwischen%';
SELECT BookID, Language
FROM books
WHERE Language Like '%ihre%';
UPDATE books
SET Language = 'German'
WHERE Language LIKE '%ihre%';

SELECT DISTINCT Language
FROM books;
SELECT MAX(LENGTH(Language)) AS max_length
FROM books;

SELECT MAX(LENGTH(BookFormat)) AS max_length
FROM books;
SELECT DISTINCT BookFormat
FROM books;

SELECT MAX(LENGTH(Pages)) AS max_length
FROM books;
SELECT DISTINCT Pages
FROM books;

SELECT MAX(LENGTH(Publisher)) AS max_length
FROM books;
SELECT MAX(Publisher)
FROM books;
SELECT DISTINCT Publisher
FROM books;

#Genre
SELECT MAX(LENGTH(GenreID)) AS max_length
FROM genres;

SELECT MAX(LENGTH(Name)) AS max_length
FROM genres;
SELECT DISTINCT Name
FROM genres;

#book_award
SELECT MAX(LENGTH(AwardID)) AS max_length
FROM book_awards;

#awards
SELECT MAX(LENGTH(Name)) AS max_length
FROM awards;
SELECT DISTINCT Name
FROM awards;
SELECT DISTINCT AwardID
FROM book_awards;

#bc_users
SELECT MAX(LENGTH(UserID)) AS max_length
FROM bc_users;
SELECT DISTINCT UserID
FROM bc_users;

SELECT MAX(LENGTH(Age)) AS max_length
FROM bc_users;
SELECT DISTINCT Age
FROM bc_users;
SELECT COUNT(*) FROM bc_users
WHERE Age = 0;
SELECT COUNT(*) FROM bc_users
WHERE Age <> 0;
SELECT COUNT(*) FROM bc_users
WHERE Age > 120;
UPDATE bc_users
SET Age = CASE 
    WHEN Age > 120 THEN Age = 0
    ELSE Age
END;

SELECT MAX(LENGTH(State)) AS max_length
FROM bc_users;
SELECT DISTINCT State
FROM bc_users;

SELECT MAX(LENGTH(Country)) AS max_length
FROM bc_users;
SELECT DISTINCT Country
FROM bc_users;

#BC_User_rating table
SELECT MAX(LENGTH(RATING)) AS max_length
FROM bc_user_ratings;
SELECT DISTINCT RATING
FROM bc_user_ratings;