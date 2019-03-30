-- Let's ask some questions of our "Instagram" database.

-- Find the 5 users who have been around the longest.
SELECT *
FROM Users
ORDER BY created_at ASC
LIMIT 5;

-- What day of the week do most users register on?
SELECT DAYNAME(created_at) AS sign_up_day,
       COUNT(*) AS count
FROM Users
GROUP BY sign_up_day
ORDER BY count DESC;

-- Find inactive users (who have never posted a photo)
SELECT U.username
FROM Users AS U
     LEFT JOIN Photos AS P
        ON U.id = P.user_id
WHERE image_url IS NULL;
