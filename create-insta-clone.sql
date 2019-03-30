-- This allows for creation of an Instagram-like schema.

-- Users table
CREATE TABLE Users
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(15) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);
