-- Customers
-- emaik: 3 customers with null emails, 2 customers with the same email
-- age: 1 customer with age -5

SELECT email, COUNT(*) AS issues
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;

SELECT age AS issues FROM customers
WHERE age < 0;
