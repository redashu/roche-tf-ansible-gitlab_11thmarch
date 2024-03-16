-- Sample database dump with employee details

-- Create database
CREATE DATABASE IF NOT EXISTS `sample_database`;
USE `sample_database`;

-- Create employees table
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `position` varchar(100) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Insert sample data
INSERT INTO `employees` (`name`, `age`, `position`, `salary`) VALUES
('John Doe', 30, 'Software Engineer', 75000.00),
('Jane Smith', 35, 'Project Manager', 90000.00),
('Alice Johnson', 25, 'Data Analyst', 60000.00),
('Bob Brown', 40, 'System Administrator', 80000.00);
