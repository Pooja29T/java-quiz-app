
-- SQL schema and sample queries for Quiz Application

-- Create database (optional)
CREATE DATABASE quiz_app;
USE quiz_app;

-- Table for users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for quiz questions
CREATE TABLE questions (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    question_text TEXT NOT NULL,
    option_a VARCHAR(255),
    option_b VARCHAR(255),
    option_c VARCHAR(255),
    option_d VARCHAR(255),
    correct_answer VARCHAR(10)
);

-- Table for quiz submissions
CREATE TABLE quiz_submissions (
    submission_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    score INT,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Insert sample data
INSERT INTO users (username, email) VALUES 
('pooja', 'pooja@example.com'),
('rahul', 'rahul@example.com');

INSERT INTO questions (question_text, option_a, option_b, option_c, option_d, correct_answer) VALUES
('What is Java?', 'Programming Language', 'OS', 'Database', 'Compiler', 'A'),
('Which SQL command retrieves data?', 'INSERT', 'UPDATE', 'SELECT', 'DELETE', 'C');

-- Sample select query
SELECT username, score 
FROM users u
JOIN quiz_submissions q ON u.user_id = q.user_id
ORDER BY score DESC;

