CREATE DATABASE vk_20211001;
USE vk_20211001;

CREATE TABLE user (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Identifier of the string",
    first_name VARCHAR(255) NOT NULL COMMENT "Name of the user",
	last_name VARCHAR(255) NOT NULL COMMENT "Lastname of the user", 
    email VARCHAR(100) NOT NULL UNIQUE COMMENT "Email",
    phone CHAR(11) NOT NULL UNIQUE COMMENT "Phone",
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Time of creating a string",
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Time of updating the string"
) COMMENT 'User table';

CREATE TABLE profiles (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Identifier of the string",
	user_id INT UNSIGNED NOT NULL COMMENT "Reference to the user",
    gender CHAR(1) NOT NULL COMMENT "Gender",
    birthday DATE COMMENT "Day of birth",
    `status` VARCHAR(30) COMMENT "Current status",
    city VARCHAR(130) COMMENT "City",
    country VARCHAR(130) COMMENT "Country",
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Time of creating a string",
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Time of updating the string"
) COMMENT 'Profile table';

ALTER TABLE profiles ADD CONSTRAINT profiles_user_id FOREIGN KEY (user_id) REFERENCES user(id);


-- SHOW TABLES;

-- DESCRIBE profiles;

-- SELECT * FROM  profiles;
