CREATE TABLE Users
(
  email VARCHAR(255) PRIMARY KEY,
  created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO Users (email) VALUES
('Katie34@yahoo.com'),
('Tunde@gmail.com');
