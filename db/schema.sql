CREATE DATABASE billtrackingapp;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT,
  email TEXT,
  password_digest TEXT
);

CREATE TABLE expenses (
  id SERIAL PRIMARY KEY,
  user_id NUMERIC,
  date DATE, 
  description TEXT,
  amount NUMERIC,
  category TEXT,
  paid BOOLEAN 
);

INSERT INTO expenses (user_id, date, description, amount, category, paid) VALUES (4, '06-11-2019', 'Water Bill', 120, 'Quarterly', false);