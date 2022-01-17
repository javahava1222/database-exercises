-- Use the albums_db database.
USE albums_db;

-- a. How many rows are in the albums table? 31 rows

-- b. How many unique artist names are in the albums table? 23 artists
SELECT DISTINCT artist 
FROM albums;

-- c. What is the primary key for the albums table? id

-- d. What is the oldest release date for any album in the albums table?  What is the most recent release date?
SELECT MAX(release_date) FROM albums; -- 2011 is the most recent
SELECT MIN(release_date) FROM albums; -- 1967 is the oldest

-- Write queries to find the following information:
-- a. The name of all albums by Pink Floyd
SELECT name FROM albums WHERE artist = 'Pink Floyd'; -- The Dark Side of the Moon, The Wall

-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released -- 1967
SELECT release_date FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";

-- c. The genre for the album Nevermind
SELECT genre FROM albums WHERE name = 'Nevermind'; -- Grunge, Alternative Rock

-- d. Which albums were released in the 1990s
SELECT name FROM albums WHERE release_date BETWEEN 1990 AND 1999;
/* 
The Bodyguard
Jagged Little Pill
Come On Over
Falling into You
Let's Talk About Love
Dangerous
The Immaculate Collection
Titanic: Music from the Motion Picture
Metallica
Nevermind
Supernatural */

-- e. Which albums had less than 20 million certified sales
SELECT name FROM albums WHERE sales < 20;
/* Grease: The Original Soundtrack from the Motion Picture
Bad
Sgt. Pepper's Lonely Hearts Club Band
Dirty Dancing
Let's Talk About Love
Dangerous
The Immaculate Collection
Abbey Road
Born in the U.S.A.
Brothers in Arms
Titanic: Music from the Motion Picture
Nevermind
The Wall */


-- f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT * FROM albums WHERE genre = 'Rock'; -- these query result does not include albums such as Hard Rock or Progressive rock because the WHERE clause specifically looks for the 'Rock' element. In order to include 'Hard Rock' or 'Progressive Rock', the WHERE clause in the query should include '%rock%'.