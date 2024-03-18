-- Create database
CREATE DATABASE gym_management;

-- Use database
USE gym_management;

-- Table for gym members
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(255),
    date_of_birth DATE,
    join_date DATE
);

-- Table for gym trainers
CREATE TABLE trainers (
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    specialty VARCHAR(100)
);

-- Table for gym classes
CREATE TABLE classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(100),
    trainer_id INT,
    schedule DATETIME,
    duration_minutes INT,
    capacity INT,
    FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id)
);

-- Table for gym equipment
CREATE TABLE equipment (
    equipment_id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_name VARCHAR(100),
    quantity INT
);

-- Table for gym memberships
CREATE TABLE memberships (
    membership_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    start_date DATE,
    end_date DATE,
    membership_type ENUM('Monthly', 'Yearly', 'Lifetime'),
    price DECIMAL(10, 2),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- Table for bookings
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    class_id INT,
    booking_date DATETIME,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

    

