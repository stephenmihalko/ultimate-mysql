-- Select all titles that contain 'stories'
SELECT title
FROM Books
WHERE title LIKE '%stories%';

-- Find the book with the most pages
SELECT title, pages
FROM Books
ORDER BY pages DESC
LIMIT 1;

-- Print summary containing title and year for 3 most recent books
SELECT CONCAT(title, ' - ', released_year) AS summary
FROM Books
ORDER BY released_year DESC
LIMIT 3;

-- Find books with a space in the author's last name
SELECT title, author_lname
FROM Books
WHERE author_lname LIKE '% %';

-- Find the three books with the lowest stock
SELECT title, released_year, stock_quantity
FROM Books
ORDER BY stock_quantity
LIMIT 3;

-- Print title and last name, sorted by author then title
SELECT title, author_lname
FROM Books
ORDER BY author_lname, title;

-- DO SOME YELLING!!!
SELECT CONCAT('MY FAVORITE AUTHOR IS ',
			  UPPER(author_fname),
			  ' ',
			  UPPER(author_lname),
			  '!')
FROM Books
ORDER BY author_lname;