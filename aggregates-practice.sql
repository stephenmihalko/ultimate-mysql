-- Print the number of books in the database
SELECT COUNT(*)
FROM Books;

-- Print how many books were released in each year
SELECT released_year,  COUNT(*)
FROM Books
GROUP BY released_year
ORDER BY released_year ASC;

-- Print the total number of books in stock
SELECT SUM(stock_quantity)
FROM Books;

-- Find the average released year for each author
SELECT author_fname, author_lname, AVG(released_year)
FROM Books
GROUP BY author_fname, author_lname
ORDER BY author_lname, author_fname;

-- Full name of author who wrote longest book
SELECT author_fname, author_lname, pages
FROM Books
ORDER BY pages DESC
LIMIT 1;

-- Make this weird thing happen
SELECT released_year AS year,
       COUNT(*) AS '# books',
       AVG(pages) AS 'avg pages'
FROM Books
GROUP BY year
ORDER BY year;
