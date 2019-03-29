-- Query title (alphabetical) and rating (ascending) for all ratings
SELECT S.title, Rv.rating
FROM Series AS S
	JOIN Reviews AS Rv
		ON S.id = Rv.series_id
ORDER BY S.title ASC, Rv.rating ASC;

-- Query title (alphabetical) and average rating
SELECT S.title, AVG(Rv.rating) AS avg_rtng
FROM Series AS S
	JOIN Reviews AS Rv
		ON S.id = Rv.series_id
GROUP BY S.title
ORDER BY avg_rtng ASC;

-- Query all reviews with
-- first_name, last_name, rating, series (becuase I want to)
SELECT Rv.first_name, Rv.last_name, R.rating, S.title
FROM (
		Reviews AS R
		JOIN Reviewers AS Rv
			ON R.reviewer_id = Rv.id
	 )
	 JOIN Series AS S
		ON R.series_id = S.id
ORDER BY Rv.last_name ASC, Rv.first_name ASC, S.title ASC;

-- Query unreviewed series
SELECT S.title
FROM Series AS S
	LEFT JOIN Reviews AS Rv
		ON S.id = Rv.series_id
WHERE Rv.rating IS NULL
ORDER BY S.title ASC;

-- Query genre and average rating for genre
SELECT S.genre, AVG(R.rating)
FROM Series AS S
	JOIN Reviews AS R
		ON S.id = R.series_id
GROUP BY S.genre
ORDER BY S.genre ASC;

-- Query reviewer statistics: first, last, how many reviews,
-- min review, max review, avg review, status (active/inactive)
SELECT 	R.first_name,
		R.last_name,
		COUNT(Rv.rating) AS COUNT,
		IFNULL(MIN(Rv.rating), 0) AS MIN,
		IFNULL(MAX(Rv.rating), 0) AS MAX,
		IFNULL(AVG(Rv.rating), 0) AS AVERAGE,
		IF (COUNT(Rv.rating) = 0, 'INACTIVE', 'ACTIVE') AS STATUS
FROM Reviewers AS R
	LEFT JOIN Reviews AS Rv
		ON R.id = Rv.reviewer_id
GROUP BY R.first_name, R.last_name;

-- The 7th challenge is completed by changing
-- the ORDER BY in challenge 3 to have title first.
