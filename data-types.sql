-- What's a good use for CHAR instead of VARCHAR?
--   Any case in which you know your data will be the same length.
--   This could include gender (M/F/X), a standardized error code schema,
--   or MAC address.

-- Fill in the blanks in the SQL code below
CREATE TABLE Inventory
(
    item_name VARCHAR(100),
    price DECIMAL(6, 2),
    quantity INT
);

-- What's the difference between DATETIME and TIMESTAMP?
--    They store the same data, but TIMESTAMP uses half the memory to store
--    and can only store dates from the epoch to sometime in 2038.

-- Print the current time
SELECT CURTIME();

-- Print the current date (not the time)
SELECT CURDATE();

-- Print out the current day of the week (number and name)
SELECT DAYNAME(NOW()), DAYOFWEEK(NOW());
                                 
-- Print today's date as mm/dd/yyyy
SELECT DATE_FORMAT(NOW(), '%m-%d-%Y');
                                 
-- Print the time as <Month name> <ordinal date> at <time>
SELECT DATE_FORMAT(NOW(), '%M %D at %t');
                                 
-- Create a tweets table that stores content, username, time created
CREATE TABLE Tweets
(
    content VARCHAR(280),
    username VARCHAR(15),
    time_created TIMESTAMP DEFAULT NOW()
);
