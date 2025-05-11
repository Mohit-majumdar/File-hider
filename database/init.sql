-- Create database
CREATE DATABASE IF NOT EXISTS file_hider_db;
USE file_hider_db;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255),
    password_hash VARCHAR(255),
    is_verified BOOLEAN DEFAULT FALSE,
    verification_code VARCHAR(255),
    verification_code_created_at DATETIME
);

-- Hidden files table
CREATE TABLE hidden_files (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    original_filename VARCHAR(255) NOT NULL,
    hidden_filename VARCHAR(255) NOT NULL,
    file_path VARCHAR(500) NOT NULL,
    hidden_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);