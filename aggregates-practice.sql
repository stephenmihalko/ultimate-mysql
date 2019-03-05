-- Print the number of books in the database
SELECT SUM(stock_quantity)
FROM Books;

-- Print how many books were released in each year
SELECT COUNT(*)
FROM Books
GROUP BY release_year;
