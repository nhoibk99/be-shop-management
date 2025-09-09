--liquibase formatted sql

--changeset shop-management:008
--comment: Add comprehensive sample data for all tables

-- Add more categories
INSERT INTO categories (name) VALUES 
('Gaming Phones'),
('Budget Phones'),
('Flagship Phones'),
('Mid-range Phones'),
('Wireless Chargers'),
('Cables & Adapters'),
('Phone Cases'),
('Screen Protectors'),
('Bluetooth Speakers'),
('Smart Home Devices'),
('Car Accessories'),
('Travel Accessories');

-- Add more users
INSERT INTO users (username, password, role, email) VALUES 
('admin2', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDi', 'ADMIN', 'admin2@mobilemart.com'),
('staff2', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDi', 'STAFF', 'staff2@mobilemart.com'),
('staff3', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDi', 'STAFF', 'staff3@mobilemart.com'),
('customer2', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDi', 'CUSTOMER', 'customer2@mobilemart.com'),
('customer3', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDi', 'CUSTOMER', 'customer3@mobilemart.com'),
('customer4', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDi', 'CUSTOMER', 'customer4@mobilemart.com'),
('customer5', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDi', 'CUSTOMER', 'customer5@mobilemart.com'),
('customer6', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDi', 'CUSTOMER', 'customer6@mobilemart.com'),
('customer7', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDi', 'CUSTOMER', 'customer7@mobilemart.com'),
('customer8', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDi', 'CUSTOMER', 'customer8@mobilemart.com');

-- Add more flagship phones
INSERT INTO products (name, description, price, old_price, condition, stock, category_id, image_url, specs) VALUES 
('iPhone 15 Pro Max (512GB, Natural Titanium)', 'Latest iPhone with titanium design, A17 Pro chip, and advanced camera system', 1299.99, 1399.99, 'NEW', 25, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "512GB", "color": "Natural Titanium", "screenSize": "6.7\" Super Retina XDR", "processor": "A17 Pro", "ram": "8GB", "camera": "48MP Main + 12MP Ultra Wide + 12MP Telephoto", "battery": "4422mAh", "os": "iOS 17"}'),
('Samsung Galaxy S24 Ultra (512GB, Titanium Gray)', 'Premium Samsung flagship with S Pen, 200MP camera, and AI features', 1299.99, 1399.99, 'NEW', 30, 1, 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=400&h=400&fit=crop', '{"storage": "512GB", "color": "Titanium Gray", "screenSize": "6.8\" AMOLED", "processor": "Snapdragon 8 Gen 3", "ram": "12GB", "camera": "200MP + 50MP + 10MP + 10MP", "battery": "5000mAh", "os": "Android 14"}'),
('Google Pixel 8 Pro (256GB, Obsidian)', 'Google flagship with advanced AI, camera processing, and clean Android experience', 999.00, 1099.00, 'NEW', 20, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "256GB", "color": "Obsidian", "screenSize": "6.7\" OLED", "processor": "Google Tensor G3", "ram": "12GB", "camera": "50MP + 48MP + 48MP", "battery": "5050mAh", "os": "Android 14"}'),
('OnePlus 12 (256GB, Silky Black)', 'OnePlus flagship with Hasselblad camera and fast charging', 799.99, 899.99, 'NEW', 35, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "256GB", "color": "Silky Black", "screenSize": "6.82\" AMOLED", "processor": "Snapdragon 8 Gen 3", "ram": "12GB", "camera": "50MP + 64MP + 48MP", "battery": "5400mAh", "os": "OxygenOS 14"}'),
('Xiaomi 14 Ultra (512GB, Black)', 'Xiaomi flagship with Leica optics and professional photography features', 1199.99, 1299.99, 'NEW', 15, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "512GB", "color": "Black", "screenSize": "6.73\" AMOLED", "processor": "Snapdragon 8 Gen 3", "ram": "16GB", "camera": "50MP + 50MP + 50MP + 50MP", "battery": "5300mAh", "os": "MIUI 15"}');

-- Add gaming phones
INSERT INTO products (name, description, price, old_price, condition, stock, category_id, image_url, specs) VALUES 
('ASUS ROG Phone 8 Pro (512GB, Phantom Black)', 'Ultimate gaming phone with advanced cooling and gaming features', 1199.99, 1299.99, 'NEW', 10, 3, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "512GB", "color": "Phantom Black", "screenSize": "6.78\" AMOLED", "processor": "Snapdragon 8 Gen 3", "ram": "24GB", "camera": "50MP + 13MP + 5MP", "battery": "6000mAh", "os": "ROG UI"}'),
('RedMagic 9 Pro (256GB, Snow White)', 'Gaming phone with active cooling and 165Hz display', 649.99, 749.99, 'NEW', 20, 3, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "256GB", "color": "Snow White", "screenSize": "6.8\" AMOLED", "processor": "Snapdragon 8 Gen 3", "ram": "12GB", "camera": "50MP + 50MP + 2MP", "battery": "6500mAh", "os": "RedMagic OS"}'),
('Black Shark 5 Pro (128GB, Black)', 'Gaming phone with physical shoulder triggers', 599.99, 699.99, 'NEW', 25, 3, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "128GB", "color": "Black", "screenSize": "6.67\" AMOLED", "processor": "Snapdragon 870", "ram": "12GB", "camera": "108MP + 13MP + 5MP", "battery": "4650mAh", "os": "JOYUI 13"}');

-- Add budget phones
INSERT INTO products (name, description, price, old_price, condition, stock, category_id, image_url, specs) VALUES 
('Samsung Galaxy A55 (128GB, Awesome Black)', 'Mid-range Samsung with great camera and performance', 399.99, 449.99, 'NEW', 50, 4, 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=400&h=400&fit=crop', '{"storage": "128GB", "color": "Awesome Black", "screenSize": "6.6\" AMOLED", "processor": "Exynos 1480", "ram": "8GB", "camera": "50MP + 12MP + 5MP", "battery": "5000mAh", "os": "Android 14"}'),
('Xiaomi Redmi Note 13 Pro (256GB, Midnight Black)', 'Budget phone with premium features and fast charging', 299.99, 349.99, 'NEW', 75, 4, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "256GB", "color": "Midnight Black", "screenSize": "6.67\" AMOLED", "processor": "Snapdragon 7s Gen 2", "ram": "12GB", "camera": "200MP + 8MP + 2MP", "battery": "5100mAh", "os": "MIUI 14"}'),
('OnePlus Nord 3 (128GB, Misty Green)', 'OnePlus mid-range with flagship features', 449.99, 499.99, 'NEW', 40, 4, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "128GB", "color": "Misty Green", "screenSize": "6.74\" AMOLED", "processor": "MediaTek Dimensity 9000", "ram": "8GB", "camera": "50MP + 8MP + 2MP", "battery": "5000mAh", "os": "OxygenOS 13"}'),
('Google Pixel 7a (128GB, Sea)', 'Google mid-range with flagship camera', 499.99, 549.99, 'NEW', 30, 4, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "128GB", "color": "Sea", "screenSize": "6.1\" OLED", "processor": "Google Tensor G2", "ram": "8GB", "camera": "64MP + 13MP", "battery": "4385mAh", "os": "Android 13"}');

-- Add more used phones
INSERT INTO products (name, description, price, old_price, condition, stock, category_id, image_url, specs) VALUES 
('iPhone 13 Pro Max (Used - Excellent)', 'Excellent condition iPhone 13 Pro Max with all accessories', 799.99, 1099.99, 'USED', 8, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "256GB", "color": "Graphite", "screenSize": "6.7\" Super Retina XDR", "processor": "A15 Bionic", "ram": "6GB", "camera": "12MP + 12MP + 12MP", "battery": "4352mAh", "os": "iOS 17"}'),
('Samsung Galaxy S22 Ultra (Used - Good)', 'Good condition Samsung S22 Ultra with S Pen', 699.99, 1199.99, 'USED', 12, 1, 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=400&h=400&fit=crop', '{"storage": "256GB", "color": "Phantom Black", "screenSize": "6.8\" AMOLED", "processor": "Snapdragon 8 Gen 1", "ram": "12GB", "camera": "108MP + 10MP + 10MP + 10MP", "battery": "5000mAh", "os": "Android 14"}'),
('Google Pixel 6 Pro (Used - Fair)', 'Fair condition Pixel 6 Pro with minor wear', 449.99, 899.99, 'USED', 15, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "128GB", "color": "Stormy Black", "screenSize": "6.7\" OLED", "processor": "Google Tensor", "ram": "12GB", "camera": "50MP + 48MP + 11MP", "battery": "5003mAh", "os": "Android 14"}'),
('OnePlus 10 Pro (Used - Good)', 'Good condition OnePlus 10 Pro with fast charging', 499.99, 899.99, 'USED', 18, 1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop', '{"storage": "256GB", "color": "Volcanic Black", "screenSize": "6.7\" AMOLED", "processor": "Snapdragon 8 Gen 1", "ram": "12GB", "camera": "48MP + 50MP + 8MP", "battery": "5000mAh", "os": "OxygenOS 12"}');

-- Add accessories - wireless chargers
INSERT INTO products (name, description, price, old_price, condition, stock, category_id, image_url, specs) VALUES 
('Apple MagSafe Charger', 'Magnetic wireless charger for iPhone 12 and later', 39.00, 49.00, 'NEW', 100, 5, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"output": "15W", "compatibility": "iPhone 12/13/14/15 series", "connectivity": "USB-C"}'),
('Samsung Wireless Charger Stand', 'Fast wireless charging stand with cooling fan', 59.99, 79.99, 'NEW', 80, 5, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"output": "15W", "compatibility": "Samsung Galaxy series", "connectivity": "USB-C"}'),
('Anker PowerWave Stand', 'Universal wireless charging stand with LED indicator', 29.99, 39.99, 'NEW', 150, 5, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"output": "10W", "compatibility": "Qi-enabled devices", "connectivity": "USB-C"}'),
('Belkin Boost Charge Pro', '3-in-1 wireless charger for iPhone, AirPods, and Apple Watch', 149.99, 199.99, 'NEW', 60, 5, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"output": "15W + 5W + 5W", "compatibility": "Apple ecosystem", "connectivity": "USB-C"}');

-- Add accessories - cables and adapters
INSERT INTO products (name, description, price, old_price, condition, stock, category_id, image_url, specs) VALUES 
('Apple USB-C to Lightning Cable (2m)', 'Official Apple cable for fast charging and data transfer', 29.00, 35.00, 'NEW', 200, 6, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"length": "2m", "connectivity": "USB-C to Lightning", "output": "20W"}'),
('Anker PowerLine III USB-C Cable', 'Durable USB-C cable with 100W power delivery', 19.99, 24.99, 'NEW', 300, 6, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"length": "1.8m", "connectivity": "USB-C to USB-C", "output": "100W"}'),
('Samsung 25W Super Fast Charger', 'Fast charging adapter for Samsung devices', 24.99, 29.99, 'NEW', 150, 6, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"output": "25W", "connectivity": "USB-C", "compatibility": "Samsung Galaxy"}'),
('Anker PowerPort III Nano', 'Compact 20W USB-C charger', 15.99, 19.99, 'NEW', 250, 6, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"output": "20W", "connectivity": "USB-C", "size": "Compact"}');

-- Add accessories - phone cases
INSERT INTO products (name, description, price, old_price, condition, stock, category_id, image_url, specs) VALUES 
('Spigen Tough Armor Case (iPhone 15 Pro)', 'Military-grade protection with kickstand', 19.99, 24.99, 'NEW', 100, 7, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"material": "TPU + Polycarbonate", "compatibility": "iPhone 15 Pro", "protection": "Military Grade"}'),
('OtterBox Defender Series (Samsung S24)', 'Ultimate protection with built-in screen protector', 49.99, 59.99, 'NEW', 80, 7, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"material": "Multi-layer", "compatibility": "Samsung Galaxy S24", "protection": "Ultimate"}'),
('Casetify Impact Case (Google Pixel 8)', 'Customizable case with MagSafe compatibility', 39.99, 49.99, 'NEW', 120, 7, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"material": "Bio-resin", "compatibility": "Google Pixel 8", "features": "MagSafe Compatible"}'),
('Apple Silicone Case (iPhone 15)', 'Official Apple silicone case with MagSafe', 49.00, 59.00, 'NEW', 90, 7, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"material": "Silicone", "compatibility": "iPhone 15", "features": "MagSafe"}');

-- Add accessories - screen protectors
INSERT INTO products (name, description, price, old_price, condition, stock, category_id, image_url, specs) VALUES 
('ZAGG InvisibleShield Glass Elite', 'Premium tempered glass with easy installation', 39.99, 49.99, 'NEW', 200, 8, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"hardness": "9H", "thickness": "0.33mm", "features": "Anti-fingerprint"}'),
('Spigen GlasTR EZ Fit', 'Tempered glass with precise alignment', 12.99, 16.99, 'NEW', 300, 8, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"hardness": "9H", "thickness": "0.26mm", "features": "Easy Installation"}'),
('ESR Tempered Glass Screen Protector', 'Crystal clear protection with oleophobic coating', 9.99, 12.99, 'NEW', 400, 8, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"hardness": "9H", "thickness": "0.3mm", "features": "Oleophobic Coating"}'),
('Whitestone Dome Glass', 'UV-cured glass with liquid adhesive', 59.99, 79.99, 'NEW', 50, 8, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"hardness": "9H", "thickness": "0.33mm", "features": "UV Cured"}');

-- Add accessories - bluetooth speakers
INSERT INTO products (name, description, price, old_price, condition, stock, category_id, image_url, specs) VALUES 
('JBL Charge 5', 'Portable Bluetooth speaker with power bank', 149.99, 179.99, 'NEW', 60, 9, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"battery": "20 hours", "connectivity": "Bluetooth 5.1", "features": "Power Bank"}'),
('Sony SRS-XB43', 'Extra bass wireless speaker with party lights', 199.99, 249.99, 'NEW', 40, 9, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"battery": "24 hours", "connectivity": "Bluetooth 5.0", "features": "Party Lights"}'),
('Bose SoundLink Revolve+', '360-degree sound with water resistance', 299.99, 349.99, 'NEW', 30, 9, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"battery": "16 hours", "connectivity": "Bluetooth 4.2", "features": "360° Sound"}'),
('Ultimate Ears Wonderboom 3', 'Compact waterproof speaker with deep bass', 99.99, 119.99, 'NEW', 80, 9, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"battery": "14 hours", "connectivity": "Bluetooth 5.1", "features": "Waterproof"}');

-- Add accessories - smart home devices
INSERT INTO products (name, description, price, old_price, condition, stock, category_id, image_url, specs) VALUES 
('Google Nest Hub (2nd Gen)', 'Smart display with Google Assistant', 99.99, 129.99, 'NEW', 50, 10, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"screen": "7\"", "connectivity": "Wi-Fi + Bluetooth", "features": "Google Assistant"}'),
('Amazon Echo Dot (5th Gen)', 'Smart speaker with Alexa', 49.99, 59.99, 'NEW', 100, 10, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"connectivity": "Wi-Fi + Bluetooth", "features": "Alexa", "audio": "1.73\" speaker"}'),
('Apple HomePod mini', 'Smart speaker with Siri and spatial audio', 99.00, 119.00, 'NEW', 70, 10, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"connectivity": "Wi-Fi + Bluetooth", "features": "Siri", "audio": "Spatial Audio"}'),
('Philips Hue Smart Bulb Starter Kit', 'Smart lighting with app control', 79.99, 99.99, 'NEW', 40, 10, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"bulbs": "3x A19", "connectivity": "Zigbee", "features": "16M colors"}');

-- Add accessories - car accessories
INSERT INTO products (name, description, price, old_price, condition, stock, category_id, image_url, specs) VALUES 
('iOttie Easy One Touch 5', 'Wireless charging car mount with one-touch release', 79.99, 99.99, 'NEW', 60, 11, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"charging": "15W", "mounting": "Dashboard/Vent", "features": "One-touch release"}'),
('Anker Roav DashCam C2 Pro', '4K dash cam with night vision', 149.99, 199.99, 'NEW', 30, 11, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"resolution": "4K", "features": "Night Vision", "storage": "MicroSD"}'),
('Belkin Car Vent Mount Pro', 'Magnetic car mount with wireless charging', 59.99, 79.99, 'NEW', 80, 11, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"charging": "10W", "mounting": "Vent", "features": "Magnetic"}'),
('Scosche MagicMount Pro', 'Magnetic phone mount for car dashboard', 24.99, 34.99, 'NEW', 120, 11, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"mounting": "Dashboard", "features": "Magnetic", "compatibility": "Universal"}');

-- Add accessories - travel accessories
INSERT INTO products (name, description, price, old_price, condition, stock, category_id, image_url, specs) VALUES 
('Anker PowerCore 10000', 'Compact portable charger with fast charging', 29.99, 39.99, 'NEW', 150, 12, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"capacity": "10000mAh", "output": "18W", "features": "Fast Charging"}'),
('Belkin Travel Power Strip', '3-outlet power strip with USB ports', 39.99, 49.99, 'NEW', 80, 12, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"outlets": "3", "usb": "2x USB-A", "features": "Surge Protection"}'),
('Nomad Base Station Pro', 'Wireless charging station for travel', 199.99, 249.99, 'NEW', 25, 12, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"charging": "15W + 7.5W + 5W", "features": "3-device charging", "material": "Aluminum"}'),
('Peak Design Tech Pouch', 'Organized travel pouch for tech accessories', 59.99, 79.99, 'NEW', 40, 12, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=300&h=300&fit=crop', '{"material": "Nylon", "features": "Organized compartments", "size": "Compact"}');
    