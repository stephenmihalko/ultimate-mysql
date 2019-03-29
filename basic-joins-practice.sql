-- Create a schema with:
--  Students: id, first_name
--  Papers: id, title, grade, student_id
CREATE TABLE Students
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(30)
);

CREATE TABLE Papers
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(100),
	grade INT,
	student_id INT,
	FOREIGN KEY(student_id) REFERENCES Students.id
	ON DELETE CASCADE
);

-- Add this data
INSERT INTO Students (first_name) VALUES
('Caleb'),
('Samantha'),
('Raj'),
('Carlos'),
('Lisa');

INSERT INTO Papers (student_id, title, grade) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Literature Through the Ages', 94),
(2, 'De Montaigne and the Art of the Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- Print first name, title, and grade
SELECT first_name, title, grade
FROM Students JOIN Papers
	ON Students.id = Papers.student_id;
ORDER BY grade DESC;

-- Print first name, title, and grade for all students, but do it good
SELECT first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0)
FROM Students LEFT JOIN Papers
	ON Students.id = Papers.student_id;

-- Print student names and paper averages
SELECT	first_name,
		IFNULL(AVG(grade), 0) AS average
FROM Students LEFT JOIN Papers
	ON Students.id = Papers.student_id
GROUP BY Students.id
ORDER BY average DESC;

-- Print students names, paper averages, and P/F
SELECT	first_name,
		IFNULL(AVG(grade), 0) AS average
		CASE
			WHEN average < 70 THEN 'FAIL'
			ELSE 'PASS'
		END AS Status
FROM Students LEFT JOIN Papers
	ON Students.id = Papers.student_id
GROUP BY Students.id
ORDER BY average DESC;