-- Create a new file called select_exercises.sql. Store your code for this exercise in that file. You should be testing your code in Sequel Ace as you go.

-- Use the albums_db database.
USE albums_db;

-- Explore the structure of the albums table.

-- a. How many rows are in the albums table? 31

-- b. How many unique artist names are in the albums table? 23
SELECT DISTINCT artist FROM albums;

-- c. What is the primary key for the albums table? id

-- d. What is the oldest release date for any album in the albums table?  What is the most recent release date?
SELECT MAX(release_date) FROM albums; -- 2011
SELECT MIN(release_date) FROM albums; -- 1967

-- Write queries to find the following information:

-- a. The name of all albums by Pink Floyd
SELECT name FROM albums WHERE artist = 'Pink Floyd'; -- The Dark Side of the Moon, The Wall

-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released -- 1967
SELECT release_date FROM albums WHERE name = 'Sgt. Pepper'\s Lonely Hearts Club Band'';

-- c. The genre for the album Nevermind
SELECT genre FROM albums WHERE name = 'Nevermind'; -- Grunge, Alt Rock

-- d. Which albums were released in the 1990s
SELECT name FROM albums WHERE release_date BETWEEN 1990 AND 1999;

e. Which albums had less than 20 million certified sales
SELECT * FROM albums WHERE sales < 20;

-- f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT * FROM albums WHERE genre = 'Rock'; -- these query result does not include albums such as Hard Rock or Progressive rock because the WHERE clause specifically looks for the 'Rock' element.