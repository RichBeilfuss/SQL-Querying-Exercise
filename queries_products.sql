-- Comments in SQL Start with dash-dash --
--Add "chair" product to table with the price of $44 and cannot be returned
INSERT INTO products
  (name, price, can_be_returned)
VALUES
  ('chair', 44.00, 'f');

-- Add "stool" product to table with price of $25.99 and can be returned
INSERT INTO products
  (name, price, can_be_returned)
VALUES
  ('stool', 25.99, 't');

--Add "table" product to table with price of $124 and cannot be returned
INSERT INTO products
  (name, price, can_be_returned)
VALUES
  ('table', 124.00, 'f');

-- Display all rows and columns of table
SELECT * FROM products;

--Display all product names
SELECT name FROM products;

--Display all product names and prices
SELECT name, price FROM products;

--Add "grill" product to table with the price of $199 and can be returned
INSERT INTO products
  (name, price, can_be_returned)
VALUES
  ('grill', 199.00, 't');

--Display returnable products
SELECT * FROM products WHERE can_be_returned;

--Display products with price below $44
SELECT * FROM products WHERE price < 44.00;

--Diplay products between prices of $22.50 and $99.99
SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99;

--Adjusting database for sale of $20 off each product
UPDATE products SET price = price - 20;

--Removing items that are sold out
DELETE FROM products WHERE price < 25;

--Adjusting products to normal price because sale is over
UPDATE products SET price = price + 20;

--Adjusting all products to returnable
UPDATE products SET can_be_returned = 't';