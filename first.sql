CREATE DATABASE IF NOT EXISTS companydb;

USE companydb;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees (name, email, department, salary)
VALUES
    ('Prasanna', 'prasanna@example.com', 'IT', 60000.00),
    ('Rahul', 'rahul@example.com', 'HR', 50000.00),
    ('Sneha', 'sneha@example.com', 'Finance', 55000.00);
