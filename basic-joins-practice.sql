-- Create a schema with:
--  Students: id, first_name
--  Papers: id, title, grade, student_id


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


-- Print first name, title, and grade for all students, but do it good


-- Print student names and paper averages


-- Print students names, paper averages, and P/F
