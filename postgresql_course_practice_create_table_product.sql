DROP DATABASE IF EXISTS self_practice;
CREATE DATABASE self_practice;

DROP TABLE IF EXISTS products cascade;
CREATE TABLE products
(
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(200)   NOT NULL,
    price           NUMERIC(10, 2) NOT NULL CHECK (price > 0),
    description     TEXT           NOT NULL,
    amount_in_stock SMALLINT CHECK (amount_in_stock >= 0),
    image_path      VARCHAR(500)
);

        INSERT INTO products (
    price,
    name,
    description,
    amount_in_stock,
    image_path
  )
VALUES (
    12.99,
    'A Book',
    'This is a book - and this text could be way longer!',
    39,
    'uploads/images/products/a-book.jpg'
  );