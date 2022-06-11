CREATE DATABASE test;

DROP TABLE IF EXISTS products;
CREATE TABLE products
(
    id SERIAL,
    name TEXT NOT NULL,
    price NUMERIC(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT products_pkey PRIMARY KEY (id)
);

-- SELECT * FROM products;

DROP TABLE IF EXISTS users;
CREATE TABLE users
(
    id SERIAL,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
    zipcode TEXT NOT NULL,
    CONSTRAINT user_pkey PRIMARY KEY (id)
);

-- SELECT * FROM users;