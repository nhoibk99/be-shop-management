--liquibase formatted sql

--changeset shop-management:002
--comment: Insert sample data for shop management system

-- Insert categories
INSERT INTO categories (name) VALUES 
('Smartphones', 'new', 'NEW'),
('Tablets', 'new', 'NEW'),
('Chargers', 'new', 'NEW'),
('Headphones', 'new', 'NEW'),
('Cases', 'new', 'NEW'),
('Screen Protectors', 'new', 'NEW'),
('Power Banks', 'new', 'NEW'),
('Smartwatches', 'new', 'NEW'),
('Earbuds');

-- Insert users (password: password123 - encoded with BCrypt)
INSERT INTO users (username, password, role, email) VALUES 
('admin', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDi', 'ADMIN', 'admin@mobilemart.com', 'new', 'NEW'),
('staff1', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDi', 'STAFF', 'staff1@mobilemart.com', 'new', 'NEW'),
('customer1', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDi', 'CUSTOMER', 'customer1@mobilemart.com', 'new', 'NEW'),
('john_doe', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDi', 'CUSTOMER', 'john.doe@email.com');

-- Insert products (New Phones)
INSERT INTO products (name, description, price, condition, stock, category_id, image_url, specs, label, label_text) VALUES 
('Samsung Galaxy S24 Ultra', 'Latest Samsung flagship with S Pen and AI features', 1199.99, 'NEW', 50, 1, 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=400&h=400&fit=crop', '{"storage": "256GB", "color": "Phantom Black", "screenSize": "6.8\" AMOLED"}', 'new', 'NEW'),
('Apple iPhone 15 Pro', 'Latest iPhone with titanium design and A17 Pro chip', 999.00, 'NEW', 45, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "128GB", "color": "Space Gray", "screenSize": "6.1\" Super Retina XDR"}', 'new', 'NEW'),
('Google Pixel 8 Pro', 'Google flagship with advanced camera and AI', 899.00, 'NEW', 30, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"color": "Obsidian", "screenSize": "6.7\" OLED"}', 'new', 'NEW'),
('Xiaomi 13 Pro', 'Xiaomi flagship with Leica optics', 649.00, 'NEW', 25, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "256GB", "color": "Ceramic Black", "screenSize": "6.73\" AMOLED"}', 'new', 'NEW'),
('OnePlus 11', 'OnePlus flagship with Hasselblad camera', 499.00, 'NEW', 35, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "256GB", "color": "Titan Black", "screenSize": "6.7\" AMOLED"}', 'new', 'NEW'),
('Nothing Phone 2', 'Unique design with Glyph interface', 599.00, 'NEW', 20, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "128GB", "color": "White", "screenSize": "6.7\" OLED"}', 'new', 'NEW'),
('ASUS ROG Phone 7', 'Gaming phone with high performance', 799.00, 'NEW', 15, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "256GB", "color": "Phantom Black", "screenSize": "6.78\" AMOLED"}', 'new', 'NEW'),
('Sony Xperia 1 V', 'Sony flagship with pro camera features', 1299.99, 'NEW', 10, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "256GB", "color": "Black", "screenSize": "6.5\" 4K OLED"}', 'new', 'NEW');

-- Insert products (Used Phones)
INSERT INTO products (name, description, price, condition, stock, category_id, image_url, specs, label, label_text) VALUES 
('iPhone 14 Pro (Used)', 'Excellent condition iPhone 14 Pro', 699.99, 'USED', 15, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "256GB", "color": "Deep Purple", "screenSize": "6.1\" Super Retina XDR"}', 'used', 'USED'),
('Samsung Galaxy S23 (Used)', 'Great condition Samsung S23', 549.99, 'USED', 12, 1, 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=400&h=400&fit=crop', '{"storage": "128GB", "color": "Phantom Black", "screenSize": "6.1\" AMOLED"}', 'used', 'USED'),
('Google Pixel 7 Pro (Used)', 'Good condition Pixel 7 Pro', 449.99, 'USED', 8, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "256GB", "color": "Obsidian", "screenSize": "6.7\" OLED"}', 'used', 'USED'),
('OnePlus 10 Pro (Used)', 'Fair condition OnePlus 10 Pro', 399.99, 'USED', 10, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "128GB", "color": "Volcanic Black", "screenSize": "6.7\" AMOLED"}', 'used', 'USED'),
('iPhone 13 (Used)', 'Good condition iPhone 13', 499.99, 'USED', 20, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "128GB", "color": "Blue", "screenSize": "6.1\" Super Retina XDR"}', 'used', 'USED'),
('Samsung Galaxy S22 (Used)', 'Fair condition Samsung S22', 399.99, 'USED', 15, 1, 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=400&h=400&fit=crop', '{"storage": "128GB", "color": "Phantom White", "screenSize": "6.1\" AMOLED"}', 'used', 'USED'),
('Google Pixel 6 Pro (Used)', 'Good condition Pixel 6 Pro', 349.99, 'USED', 12, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "128GB", "color": "Stormy Black", "screenSize": "6.7\" OLED"}', 'used', 'USED'),
('OnePlus 9 Pro (Used)', 'Fair condition OnePlus 9 Pro', 299.99, 'USED', 18, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "128GB", "color": "Morning Mist", "screenSize": "6.7\" AMOLED"}', 'old', 'USED');

-- Insert accessories
INSERT INTO products (name, description, price, condition, stock, category_id, image_url, specs, label, label_text) VALUES 
('Apple AirPods Pro (2nd Generation)', 'Active noise cancellation wireless earbuds', 249.99, 'NEW', 100, 9, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=150&h=150&fit=crop&crop=center', '{"color": "White", "connectivity": "Bluetooth 5.0"}', 'new', 'NEW'),
('Samsung Galaxy Buds2 Pro', 'Premium wireless earbuds with 360 Audio', 229.99, 'NEW', 80, 9, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=150&h=150&fit=crop&crop=center', '{"color": "Phantom Black", "connectivity": "Bluetooth 5.2"}', 'new', 'NEW'),
('Apple Watch Series 9', 'Latest Apple Watch with health features', 399.99, 'NEW', 60, 8, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=150&h=150&fit=crop&crop=center', '{"size": "45mm", "color": "Midnight"}', 'new', 'NEW'),
('Samsung Galaxy Watch 6', 'Premium Android smartwatch', 349.99, 'NEW', 50, 8, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=150&h=150&fit=crop&crop=center', '{"size": "44mm", "color": "Graphite"}', 'new', 'NEW'),
('Anker PowerCore 20000', 'High-capacity portable charger', 49.99, 'NEW', 200, 7, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=150&h=150&fit=crop&crop=center', '{"capacity": "20000mAh", "output": "18W"}', 'new', 'NEW'),
('Spigen Tough Armor Case', 'Premium protective phone case', 19.99, 'NEW', 300, 5, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=150&h=150&fit=crop&crop=center', '{"material": "TPU + Polycarbonate", "compatibility": "iPhone 15 Pro"}', 'new', 'NEW'),
('Tempered Glass Screen Protector', '9H hardness screen protection', 9.99, 'NEW', 500, 6, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=150&h=150&fit=crop&crop=center', '{"hardness": "9H", "thickness": "0.33mm"}', 'new', 'NEW'),
('Anker PowerPort Speed+', 'Fast charging wall adapter', 29.99, 'NEW', 150, 3, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=150&h=150&fit=crop&crop=center', '{"output": "30W", "ports": "1 USB-C"}', 'new', 'NEW');

-- Insert inventory records
INSERT INTO inventory (product_id, quantity) 
SELECT id, stock FROM products;

-- Insert sample orders
INSERT INTO orders (user_id, status, total_amount, shipping_address, shipping_method, payment_method) VALUES 
(3, 'PENDING', 1199.99, '123 Main St, City, State 12345', 'Standard Shipping', 'Credit Card', 'new', 'NEW'),
(4, 'CONFIRMED', 899.99, '456 Oak Ave, Town, State 67890', 'Express Shipping', 'PayPal');

-- Insert sample order items
INSERT INTO order_items (order_id, product_id, quantity, unit_price, total_price) VALUES 
(1, 1, 1, 1199.99, 1199.99),
(2, 3, 1, 899.00, 899.00);
