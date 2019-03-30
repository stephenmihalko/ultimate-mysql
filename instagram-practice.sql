-- Let's ask some questions of our "Instagram" database.

-- Find the 5 users who have been around the longest.
SELECT *
FROM Users
ORDER BY created_at ASC
LIMIT 5;

-- What day of the week do most users register on?
SELECT DATE_FORMAT(created_at,'%W') AS sign_up_day,
       COUNT(DATE_FORMAT(created_at,'%W')) AS count
FROM Users
GROUP BY sign_up_day
ORDER BY count DESC;
