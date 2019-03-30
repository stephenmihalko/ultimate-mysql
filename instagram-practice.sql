-- Let's ask some questions of our "Instagram" database.

-- 1. Find the 5 users who have been around the longest.
SELECT *
FROM Users
ORDER BY created_at ASC
LIMIT 5;

-- 2. What day of the week do most users register on?
SELECT DAYNAME(created_at) AS sign_up_day,
       COUNT(*) AS count
FROM Users
GROUP BY sign_up_day
ORDER BY count DESC;

-- 3. Find inactive users (who have never posted a photo)
SELECT U.username
FROM Users AS U
     LEFT JOIN Photos AS P
        ON U.id = P.user_id
WHERE image_url IS NULL;

-- 4. Who got the most likes on a photo?
SELECT U.username, COUNT(*) AS pic_likes
FROM Users AS U
INNER JOIN Photos AS P
  ON U.id = P.user_id
INNER JOIN Likes AS L
  ON P.id = L.photo_id
GROUP BY P.id
ORDER BY pic_likes DESC
LIMIT 10;

-- 5. How many times does the average user post?
SELECT (SELECT COUNT(*) FROM Photos) /
       (SELECT COUNT(*) FROM Users) AS avg_posts;

-- 6. What are the 5 most commonly used hashtags?
SELECT T.tag_name, COUNT(*) AS num_tags
FROM Tags AS T
INNER JOIN Photo_Tags AS Pt
  ON T.id = Pt.tag_id
GROUP BY T.tag_name
ORDER BY num_tags DESC
LIMIT 10;

-- 7. Find users who have liked every photo on the site
SELECT U.username
FROM Likes AS L
INNER JOIN Users AS U
  ON U.id = L.user_id
GROUP BY user_id
HAVING COUNT(*) = (SELECT COUNT(*) FROM Photos);
