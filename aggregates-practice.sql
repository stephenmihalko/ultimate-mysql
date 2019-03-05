-- Print the number of books in the database
SELECT SUM(stock_quantity)
FROM Books;

-- Print how many books were released in each year
SELECT released_year,  COUNT(*)
FROM Books
GROUP BY released_year
ORDER BY released_year ASC;
