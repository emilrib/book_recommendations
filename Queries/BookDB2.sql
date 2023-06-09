CREATE DATABASE BookDB;
USE BookDB;

CREATE TABLE Books (
ISBN INTEGER PRIMARY KEY,
Title TEXT,
Series_Name TEXT,
Author TEXT,
Rating_GR INTEGER,
Description TEXT,
Language TEXT,
Characters TEXT,
BookFormat TEXT,
Edition TEXT,
Pages INTEGER,
Publisher TEXT,
NumRatings_GR INTEGER,
RatingsByStars_GR INTEGER,
LikedPercent INTEGER,
BBEScore INTEGER,
BBEVotes INTEGER,
Price INTEGER );

CREATE TABLE Genres (
GenreID INTEGER PRIMARY KEY,
Name TEXT) ;

CREATE TABLE Book_Genres (
ISBN INTEGER,
GenreID INTEGER,
PRIMARY KEY (ISBN, GenreID),
FOREIGN KEY (ISBN) REFERENCES Books (ISBN),
FOREIGN KEY (GenreID) REFERENCES Genres (GenreID)) ;

CREATE TABLE Awards (
AwardID INTEGER PRIMARY KEY,
Name TEXT);

CREATE TABLE Book_Awards (
ISBN INTEGER,
AwardID INTEGER,
PRIMARY KEY (ISBN, AwardID),
FOREIGN KEY (ISBN) REFERENCES Books (ISBN),
FOREIGN KEY (AwardID) REFERENCES Awards (AwardID)) ;

CREATE TABLE BC_Users (
UserID INTEGER PRIMARY KEY,
Location TEXT,
Age INTEGER);

CREATE TABLE BC_User_Ratings (
UserID INTEGER,
ISBN INTEGER,
RATING INTEGER,
PRIMARY KEY (UserID, ISBN),
FOREIGN KEY (ISBN) REFERENCES Books (ISBN),
FOREIGN KEY (UserID) REFERENCES BC_Users (UserID));

ALTER TABLE Books
MODIFY Genre TEXT;
ALTER TABLE Books
MODIFY Awards TEXT;
ALTER TABLE Books
MODIFY ISBN INTEGER;
ALTER TABLE Books
DROP COLUMN First_PublishDate;
ALTER TABLE Books
DROP COLUMN PublishDate;

ALTER TABLE BC_Users
DROP COLUMN Location;
ALTER TABLE BC_Users
ADD City TEXT;
ALTER TABLE BC_Users
ADD State TEXT;
ALTER TABLE BC_Users
ADD Country TEXT;
ALTER TABLE BC_Users 
MODIFY Age INTEGER AFTER Country;

