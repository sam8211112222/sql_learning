DROP DATABASE IF EXISTS talently;
CREATE DATABASE talently;
USE talently;

CREATE TABLE talently.users (
  full_name VARCHAR(200),
  yearly_salary INT,
  current_status ENUM('employed', 'self-employed', 'unemployed') -- MySQL syntax
);

INSERT INTO users (yearly_salary, full_name, current_status)
VALUES (25000, 'Julie Barnes', 'employed');

INSERT INTO users (yearly_salary, full_name, current_status)
VALUES (0, 'Michael Smith', 'unemployed');



CREATE TABLE employers (
  company_name VARCHAR(250),
  company_address VARCHAR(300),
  -- yearly_revenue FLOAT(5,2) -- Approximation, Allowed: 123.12, 12.1, Not allowed: 1234.12, 1.123
  yearly_revenue NUMERIC(5,2), -- Exact value, Allowed: 123.12, Not allowed: 12345.123
  is_hiring BOOLEAN DEFAULT FALSE
);

CREATE TABLE conversations (
  user_name VARCHAR(200),
  employer_name VARCHAR(250),
  message TEXT,
  date_sent TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO employers (company_name, company_address, yearly_revenue, is_hiring)
VALUES ('Learning Inc', 'Educationstreet 12, London', 0.87, TRUE);

INSERT INTO employers (company_name, company_address, yearly_revenue)
VALUES ('Big Oil Inc', 'Slipperystreet 110, Houston', 112.55);

INSERT INTO employers (company_name, company_address, yearly_revenue, is_hiring)
VALUES ('Hipster Food', 'Avocadostreet 5, Berlin', 6.12, TRUE);

INSERT INTO conversations (user_name, employer_name, message)
VALUES ('Max Schwarz', 'Learning Inc', 'Hi, I like learning!');

ALTER TABLE employers
MODIFY COLUMN yearly_revenue FLOAT; -- MySQL

ALTER TABLE users
MODIFY COLUMN full_name VARCHAR(300) NOT NULL,
MODIFY COLUMN current_status ENUM('employed', 'self-employed', 'unemployed') NOT NULL;

# SELECT AVG(yearly_salary) FROM users;

UPDATE users
SET yearly_salary = NULL
WHERE full_name = 'Michael Smith';

ALTER TABLE users
ADD CONSTRAINT yearly_salary_positive CHECK (yearly_salary > 0);