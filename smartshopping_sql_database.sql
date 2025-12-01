-- SmartShopping SQL Database Script
-- This script creates the SmartShopping database schema
-- and inserts sample data for demonstration purposes.

-- Create database (optional - comment out if not needed)
-- CREATE DATABASE smartshopping;
-- USE smartshopping;

-- Drop tables if they already exist (for re-runs)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS cart_items;
DROP TABLE IF EXISTS carts;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;

-- Users table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    created_at DATE
);

-- Categories table
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_products_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);

-- Carts table
CREATE TABLE carts (
    cart_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    created_at DATE,
    status VARCHAR(20) DEFAULT 'Active', -- Active / Converted / Abandoned
    CONSTRAINT fk_carts_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
);

-- Cart items table
CREATE TABLE cart_items (
    cart_item_id INT PRIMARY KEY,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT fk_cartitems_cart
        FOREIGN KEY (cart_id)
        REFERENCES carts(cart_id),
    CONSTRAINT fk_cartitems_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date DATE,
    total_amount DECIMAL(10,2),
    payment_method VARCHAR(20),
    order_status VARCHAR(20), -- Placed / Shipped / Delivered / Cancelled
    CONSTRAINT fk_orders_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
);

-- Order items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_orderitems_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CONSTRAINT fk_orderitems_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- Insert sample users
INSERT INTO users (user_id, full_name, email, phone, created_at) VALUES
(1, 'Rajesh Kumar', 'rajesh@example.com', '9876543210', '2024-01-05'),
(2, 'Anita Sharma', 'anita@example.com', '9876501234', '2024-02-10'),
(3, 'Rohan Verma', 'rohan@example.com', '9876512345', '2024-03-15');

-- Insert sample categories
INSERT INTO categories (category_id, category_name) VALUES
(1, 'Groceries'),
(2, 'Electronics'),
(3, 'Home & Kitchen'),
(4, 'Personal Care');

-- Insert sample products
INSERT INTO products (product_id, product_name, category_id, price, stock, is_active) VALUES
(1, 'Fortune Sunflower Oil 1L', 1, 165.00, 50, TRUE),
(2, 'Tata Salt 1kg', 1, 28.00, 100, TRUE),
(3, 'Colgate Toothpaste 150g', 4, 85.00, 40, TRUE),
(4, 'Prestige Pressure Cooker 5L', 3, 1999.00, 10, TRUE),
(5, 'USB-C Fast Charger', 2, 699.00, 25, TRUE),
(6, 'LED Bulb 9W', 3, 120.00, 60, TRUE);

-- Insert sample carts
INSERT INTO carts (cart_id, user_id, created_at, status) VALUES
(101, 1, '2024-04-01', 'Converted'),
(102, 1, '2024-04-10', 'Active'),
(103, 2, '2024-04-12', 'Abandoned');

-- Insert sample cart items
INSERT INTO cart_items (cart_item_id, cart_id, product_id, quantity) VALUES
(1, 101, 1, 2),
(2, 101, 2, 1),
(3, 102, 3, 1),
(4, 103, 5, 1);

-- Insert sample orders
INSERT INTO orders (order_id, user_id, order_date, total_amount, payment_method, order_status) VALUES
(1001, 1, '2024-04-01', 358.00, 'UPI', 'Delivered'),
(1002, 2, '2024-04-15', 2782.00, 'Card', 'Shipped');

-- Insert sample order items
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1001, 1, 2, 165.00),
(2, 1001, 2, 1, 28.00),
(3, 1002, 4, 1, 1999.00),
(4, 1002, 5, 1, 699.00),
(5, 1002, 6, 2, 120.00);

-- Sample analytical queries (optional)

-- 1. Total revenue generated
-- SELECT SUM(total_amount) AS total_revenue FROM orders;

-- 2. Top selling products by quantity
-- SELECT p.product_name, SUM(oi.quantity) AS total_qty
-- FROM order_items oi
-- JOIN products p ON oi.product_id = p.product_id
-- GROUP BY p.product_id, p.product_name
-- ORDER BY total_qty DESC;

-- 3. Orders summary by user
-- SELECT u.full_name, COUNT(o.order_id) AS total_orders, SUM(o.total_amount) AS total_spent
-- FROM users u
-- JOIN orders o ON u.user_id = o.user_id
-- GROUP BY u.user_id, u.full_name;