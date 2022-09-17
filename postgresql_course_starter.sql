DROP DATABASE IF EXISTS talently;
CREATE DATABASE talently;

-- Postgresql + ENUM => We have to create a custom type first
DROP TYPE IF EXISTS employment_status cascade;
CREATE TYPE employment_status AS ENUM('employed', 'self-employed', 'unemployed');

DROP TABLE IF EXISTS users cascade;
CREATE TABLE users (
  full_name VARCHAR(200),
  yearly_salary INT,
  current_status employment_status
);

INSERT INTO users (yearly_salary, full_name, current_status)
VALUES (25000, 'Julie Barnes', 'employed');

INSERT INTO users (yearly_salary, full_name, current_status)
VALUES (0, 'Michael Smith', 'unemployed');

DROP TABLE IF EXISTS employers cascade;
CREATE TABLE employers (
  company_name VARCHAR(250),
  company_address VARCHAR(300),
  -- yearly_revenue FLOAT(5,2) -- Approximation, Allowed: 123.12, 12.1, Not allowed: 1234.12, 1.123
  yearly_revenue NUMERIC(5,2), -- Exact value, Allowed: 123.12, Not allowed: 12345.123
  is_hiring BOOLEAN DEFAULT FALSE
);

DROP TABLE IF EXISTS conversations cascade;
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
ALTER COLUMN yearly_revenue SET DATA TYPE FLOAT; -- Postgresql

ALTER TABLE users
ALTER COLUMN full_name SET NOT NULL, -- Postgresql
ALTER COLUMN current_status SET NOT NULL; -- Postgresql

-- SELECT AVG(yearly_salary) FROM users;

UPDATE users
SET yearly_salary = NULL
WHERE full_name = 'Michael Smith';

ALTER TABLE users
ADD CONSTRAINT yearly_salary_positive CHECK (yearly_salary > 0);