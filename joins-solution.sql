-- Get all customers and their addresses.

SELECT * FROM customers
JOIN addresses ON customers.id = addresses.customer_id;

-- Get all orders and their line items (orders, quantity and product).

SELECT orders.order_date, line_items.quantity, products.description  FROM orders
JOIN line_items ON orders.id = line_items.order_id
JOIN products ON products.id = line_items.product_id;

-- Which warehouses have cheetos?

SELECT warehouse.warehouse, products.description FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE products.description = 'cheetos';

-- Which warehouses have diet pepsi?

SELECT warehouse.warehouse, products.description FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE products.description = 'diet pepsi';

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT count(orders.id), customers.first_name, customers.last_name FROM customers
JOIN addresses ON customers.id = addresses.customer_id
FULL OUTER JOIN orders ON orders.address_id = addresses.id
GROUP BY customers.first_name, customers.last_name;

-- How many customers do we have?

SELECT * FROM customers;

-- How many products do we carry?

SELECT * FROM products;

-- What is the total available on-hand quantity of diet pepsi?

SELECT SUM(line_items.quantity) AS total_diet_pepsi
FROM products
JOIN line_items ON line_items.product_id = products.id
WHERE products.description = 'diet pepsi';
