SET GLOBAL local_infile = true;

LOAD DATA LOCAL INFILE '/Users/Christina/OneDrive - Hochschule Luzern/DBM Project/Data/books-upload.csv'
INTO TABLE Books
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
IGNORE 1 LINES;

SELECT * FROM Books;

LOAD DATA LOCAL INFILE '/Users/Christina/OneDrive - Hochschule Luzern/DBM Project/Data/BookCrossingDatasets/BX-Users-NEW3.csv'
INTO TABLE bc_users
FIELDS TERMINATED BY ';'
IGNORE 1 LINES;

SELECT * FROM bc_users;

LOAD DATA LOCAL INFILE '/Users/Christina/OneDrive - Hochschule Luzern/DBM Project/Data/BookCrossingDatasets/BX-Book-Ratings-NEW.csv'
INTO TABLE BC_User_Ratings
FIELDS TERMINATED BY ';'
IGNORE 1 LINES;

SELECT * FROM BC_User_Ratings;

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