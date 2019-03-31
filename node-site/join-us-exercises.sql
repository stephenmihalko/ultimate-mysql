-- 1. Find the earliest date that a user joined as "Month ordinal YYYY"
--    The field should be called "earliest_date"
SELECT DATE_FORMAT(MIN(created_at), '%M %D %Y') AS earliest_date
FROM Users;

-- 2. Find the email of the earliest user
SELECT email
FROM Users
WHERE created_at = (SELECT MIN(created_at) FROM Users);

-- 3. Print number of users joined by month
SELECT MONTHNAME(created_at) AS month,
       COUNT(*) AS the_count
FROM Users
GROUP BY month
ORDER BY the_count DESC;

-- 4. Count number of users with yahoo emails

-- 5. Find the total users per email host
