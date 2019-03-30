-- This allows for creation of an Instagram-like schema.

-- Users table
CREATE TABLE Users
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(15) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Photos table
CREATE TABLE Photos
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  url VARCHAR(30) UNIQUE NOT NULL,
  user_id NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES Users(id)
);
