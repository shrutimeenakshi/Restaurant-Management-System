-- MySQL-compatible database schema for restaurant system

-- Create database (if not already created)
CREATE DATABASE IF NOT EXISTS restaurant_db;
USE restaurant_db;

-- Table for storing admin credentials
CREATE TABLE IF NOT EXISTS admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL -- Store hashed passwords for security
);

-- Table for storing menu items
CREATE TABLE IF NOT EXISTS menu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image_url VARCHAR(255) -- Path to image file
);

-- Table for storing customer orders
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    menu_item_id INT NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (menu_item_id) REFERENCES menu(id)
);

-- Insert sample admin user (use hashed passwords in real applications)
INSERT INTO admin (username, password) VALUES ('admin', 'admin123');
