SET GLOBAL local_infile = true;

LOAD DATA LOCAL INFILE '/Users/natal/Downloads/books_1.Best_Books_Ever.csv'
INTO TABLE Books
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
IGNORE 1 LINES;

SELECT * FROM Books;

DELETE FROM BC_Users;

LOAD DATA LOCAL INFILE '/Users/natal/Downloads/BX-Users-NEW2.csv'
INTO TABLE BC_Users
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
IGNORE 1 LINES;

SELECT * FROM BC_Users;

DELETE FROM BC_User_Ratings;

LOAD DATA LOCAL INFILE '/Users/natal/Downloads/BX-Book-Ratings2.csv'
INTO TABLE BC_User_Ratings
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
IGNORE 1 LINES;

SELECT * FROM BC_User_Ratings;

DELETE FROM BC_User_Ratings WHERE ISBN NOT IN 
(SELECT ISBN from Books);

LOAD DATA LOCAL INFILE '/Users/Christina/OneDrive - Hochschule Luzern/DBM Project/Data/awards_ids.csv'
INTO TABLE awards
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

SELECT * FROM awards;

LOAD DATA LOCAL INFILE '/Users/Christina/OneDrive - Hochschule Luzern/DBM Project/Data/genres_ids.csv'
INTO TABLE genres
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

SELECT * FROM genres;

LOAD DATA LOCAL INFILE '/Users/Christina/OneDrive - Hochschule Luzern/DBM Project/Data/book_genres_final.csv'
INTO TABLE book_genres
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

SELECT * FROM book_genres;

LOAD DATA LOCAL INFILE '/Users/Christina/OneDrive - Hochschule Luzern/DBM Project/Data/book_awards_final.csv'
INTO TABLE book_awards
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

SELECT * FROM book_awards;