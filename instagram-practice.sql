-- Let's ask some questions of our "Instagram" database.

-- Find the 5 users who have been around the longest.
SELECT *
FROM Users
ORDER BY created_at ASC
LIMIT 5;
