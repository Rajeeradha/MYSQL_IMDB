CREATE SCHEMA IMDB;

-- Creating a table for Movies
CREATE TABLE Movies (
    Id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Movie_name VARCHAR(255),
    Rating FLOAT,
    Length_minutes INTEGER,
    Released_year YEAR,
    Director VARCHAR(255)
);

-- Inserting data into Movies table
INSERT INTO Movies( Movie_name, Rating, Length_minutes, Released_year, Director )
VALUES ('Titanic', 7.9, 194, 1997, 'James Cameron'),
('Jurassic World', 6.9, 124, 2015, 'Colin Trevorrow'),
('Furious 7', 7.1, 137, 2015, 'James Wan'),
('The Lion King', 6.8, 118, 2019, 'Jon Favreau'),
('The Avengers', 8.0, 143, 2012, 'Joss Whedon');

SELECT * FROM Movies;

-- Creating a table for Media
CREATE TABLE Media (
    Media_Id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Media_movie VARCHAR(255),
    Media_format VARCHAR(255),
    Movie_Id INT,
	CONSTRAINT Fk_movieId FOREIGN KEY (Movie_Id) REFERENCES Movies(Id)
);

-- Inserting data into Media table
INSERT INTO Media ( Media_movie, Media_format, Movie_Id )
VALUES ('The Avengers Trailer', 'mp4',  5 ),
('The Lion King Trailer', 'jpeg',  4 ),
('Furious 7 Trailer', 'mp4',  3 ),
('Jurassic World Trailer', 'mp4',  2 ),
('Titanic Trailer', 'mp4',  1 ),
('Titanic posters', 'jpeg',  1 ),
('Jurassic World posters', 'jpeg',  2 ),
('Furious 7 posters', 'jpeg',  3 ),
('The Lion King posters', 'jpeg',  4 ),
('The Avengers posters', 'jpeg',  5 );

SELECT * FROM Media;


-- Creating a table for Genres
CREATE TABLE Genres (
    Genre_Id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Genre VARCHAR(255),
    Movie_Id INT,
    CONSTRAINT Fk_movieGenres FOREIGN KEY (Movie_Id) REFERENCES Movies (Id)
);

-- Inserting data into Genres table
INSERT INTO Genres(Genre, Movie_Id)
VALUES ('Romance', 1),
('Historical drama', 1),
('Action',2),
('Crime Thriller',3),
('Children film',4),
('Superhero', 5),
('Fantasy', 5),
('Animation', 4);

SELECT * FROM Genres;

-- Creating a table for Reviews
CREATE TABLE Reviews (
   Review_Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   Review_comments VARCHAR(255)
);

-- Inserting data into Reviews table
INSERT INTO Reviews ( Review_comments )
VALUES ('Hit'),
('Average'),
('Flop');

SELECT * FROM Reviews;

-- Creating a table for Public Comments
CREATE TABLE Public (
	Public_Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Public_name VARCHAR(255),
     Movie_Id INT,
    CONSTRAINT Fk_movieReview FOREIGN KEY(Movie_Id) REFERENCES Movies(Id),
     Review_Id INT,
    CONSTRAINT Fk_movieComments FOREIGN KEY(Review_Id) REFERENCES Movies(Id)
);

-- Inserting data into Public table
INSERT INTO Public ( Public_name, Movie_Id, Review_Id  )
VALUES ('Henry', 1, 1),
('Jackson', 1, 2),
('Daniel', 2, 2),
('David', 3, 1),
('Lincoln', 4, 3),
('Charles', 5, 1),
('Andrew', 3, 2);

SELECT * FROM Public;

-- Creating a table for Artist
CREATE TABLE Artists(
	Movie_Id INT,
    CONSTRAINT Fk_movieArtists FOREIGN KEY(Movie_Id) REFERENCES Movies(Id),
    Artist_name VARCHAR(255),
    Artist_role VARCHAR(255)
);

-- Inserting data into Artist table
INSERT INTO Artists (Movie_Id, Artist_name, Artist_role)
VALUES (1, 'Leonardo DiCaprio', 'Traveller '),
(2, 'Chris Pratt', 'Navy veteran'),
(3, 'Paul Walker', 'Police '),
(4, 'Donald Glover', 'voices of Simba'),
(5, 'Robert Downey Jr.', 'Scientist');

SELECT * FROM Artists;