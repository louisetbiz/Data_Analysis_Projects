-- Products
-- product_id 30 negative price -999
-- product_id 31 category NULL
-- products with same name: Laptop, product_id 1 and product_id 30


SELECT *
FROM products;

SELECT product_name, COUNT(*) AS occurrences
FROM products
GROUP BY product_name
HAVING COUNT(*) > 1;

SELECT product_name, product_id
FROM products
WHERE product_name = 'Laptop';
