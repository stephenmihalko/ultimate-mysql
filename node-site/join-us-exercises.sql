-- 1. Find the earliest date that a user joined as "Month ordinal YYYY"
--    The field should be called "earliest_date"
SELECT DATE_FORMAT(created_at, '%M %D %Y') AS earliest_date
FROM Users
ORDER BY created_at
LIMIT 1;

-- 2. Find the email of the earliest user

-- 3. Print number of users joined by month

-- 4. Count number of users with yahoo emails

-- 5. Find the total users per email host
