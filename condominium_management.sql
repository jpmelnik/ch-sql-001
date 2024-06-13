-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS condominium_management;

-- Use the database
USE condominium_management;

-- Create the administrators table if it doesn't exist
CREATE TABLE IF NOT EXISTS administrators (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    phone VARCHAR(50),
    email VARCHAR(255)
);

-- Create the condominiums table if it doesn't exist
CREATE TABLE IF NOT EXISTS condominiums (
    condo_id INT PRIMARY KEY AUTO_INCREMENT,
    condo_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    unit_count INT NOT NULL,
    creation_date DATE NOT NULL,
    admin_id INT,
    contact_phone VARCHAR(50),
    contact_email VARCHAR(255),
    reserve_fund DECIMAL(10, 2),
    status VARCHAR(50),
    last_meeting_date DATE,
    FOREIGN KEY (admin_id) REFERENCES administrators(admin_id)
);

-- Create the units table if it doesn't exist
CREATE TABLE IF NOT EXISTS units (
    unit_id INT PRIMARY KEY AUTO_INCREMENT,
    condo_id INT NOT NULL,
    number VARCHAR(50) NOT NULL,
    type VARCHAR(50) NOT NULL,
    square_meters DECIMAL(10, 2),
    owner_id INT,
    FOREIGN KEY (condo_id) REFERENCES condominiums(condo_id),
    FOREIGN KEY (owner_id) REFERENCES owners(owner_id)
);

-- Create the owners table if it doesn't exist
CREATE TABLE IF NOT EXISTS owners (
    owner_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    phone VARCHAR(50),
    email VARCHAR(255)
);

-- Create the expenses table if it doesn't exist
CREATE TABLE IF NOT EXISTS expenses (
    expense_id INT PRIMARY KEY AUTO_INCREMENT,
    unit_id INT NOT NULL,
    month_year DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    payment_status VARCHAR(50) NOT NULL,
    FOREIGN KEY (unit_id) REFERENCES units(unit_id)
);

-- Create the payments table if it doesn't exist
CREATE TABLE IF NOT EXISTS payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    expense_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    FOREIGN KEY (expense_id) REFERENCES expenses(expense_id)
);

-- Create the common_expenses table if it doesn't exist
CREATE TABLE IF NOT EXISTS common_expenses (
    expense_id INT PRIMARY KEY AUTO_INCREMENT,
    condo_id INT NOT NULL,
    description VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    category VARCHAR(50) NOT NULL,
    FOREIGN KEY (condo_id) REFERENCES condominiums(condo_id)
);

-- Create the meetings table if it doesn't exist
CREATE TABLE IF NOT EXISTS meetings (
    meeting_id INT PRIMARY KEY AUTO_INCREMENT,
    condo_id INT NOT NULL,
    date DATE NOT NULL,
    description TEXT,
    decisions_made TEXT,
    FOREIGN KEY (condo_id) REFERENCES condominiums(condo_id)
);

-- Create the notices table if it doesn't exist
CREATE TABLE IF NOT EXISTS notices (
    notice_id INT PRIMARY KEY AUTO_INCREMENT,
    condo_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    publication_date DATE NOT NULL,
    FOREIGN KEY (condo_id) REFERENCES condominiums(condo_id)
);

-- Create the maintenance table if it doesn't exist
CREATE TABLE IF NOT EXISTS maintenance (
    maintenance_id INT PRIMARY KEY AUTO_INCREMENT,
    condo_id INT NOT NULL,
    description TEXT NOT NULL,
    scheduled_date DATE NOT NULL,
    provider VARCHAR(255),
    estimated_cost DECIMAL(10, 2),
    FOREIGN KEY (condo_id) REFERENCES condominiums(condo_id)
);
