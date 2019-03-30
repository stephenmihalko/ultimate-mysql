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
  image_url VARCHAR(30) UNIQUE NOT NULL,
  user_id NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES Users(id)
);

-- Comments table
CREATE TABLE Comments
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  comment_text VARCHAR(140) NOT NULL,
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES Users(id),
  FOREIGN KEY(photo_id) REFERENCES Photos(id)
);

-- Likes table
CREATE TABLE Likes
(
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY(user_id, photo_id)
);

-- Followers table
CREATE TABLE Follows
(
  follower_id INT NOT NULL,
  followee_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY(follower_id, followee_id)
);

-- Two more tables for tags
CREATE TABLE Tags
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  tag_text VARCHAR(30) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE Photo_Tags
(
  photo_id INT NOT NULL,
  tag_id INT NOT NULL,
  PRIMARY KEY(photo_id, tag_id)
);
