-- Select all books written strictly before 1980
SELECT *
FROM Books
WHERE released_year < 1980;

-- Select all books written by Eggers or Chabon
SELECT *
FROM Books
WHERE author_lname IN ('Eggers', 'Chabon');

-- Written by Lahiri after 2000
SELECT *
FROM Books
WHERE author_lname = 'Lahiri'
      && released_year > 2000;

-- Pages 100-200
SELECT *
FROM Books
WHERE pages BETWEEN 100 AND 200;

-- Last name starts with C or S
SELECT *
FROM Books
WHERE author_lname LIKE 'C%'
      || author_lname LIKE 'S%';

-- Title contains "stories" --> Short Stories
-- "Just Kids" and "A Heartbreaking Work..." --> Memoirs
-- Else --> Novel
SELECT title,
CASE
  WHEN title LIKE '%stories%' THEN 'Short Stories'
  WHEN title = 'Just Kids' ||
       title = 'A Heartbreaking Work of Staggering Genius'
       THEN 'Memoirs'
  ELSE 'Novel'
  END AS 'Format'
FROM Books;

-- Get last name and number of books with "book" or "books" actually written out
SELECT author_fname, author_lname,
       CONCAT(COUNT(*) AS CT,
       CASE
          WHEN CT = 1 THEN 'book'
          ELSE 'books'
          END
        )
FROM Books
GROUP BY author_fname, author_lname;
