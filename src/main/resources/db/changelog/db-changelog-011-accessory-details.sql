--liquibase formatted sql

--changeset shop-management:011
--comment: Add detailed specifications and data for accessories

-- Add detailed specifications for accessories
INSERT INTO product_specifications (product_id, spec_key, spec_value) VALUES 
-- Apple MagSafe Charger specs
(11, 'Output Power', '15W'),
(11, 'Input Power', '20W'),
(11, 'Compatibility', 'iPhone 12/13/14/15 series'),
(11, 'Connectivity', 'USB-C'),
(11, 'Cable Length', '1m'),
(11, 'Material', 'Silicone'),
(11, 'Features', 'Magnetic alignment, LED indicator'),
(11, 'Safety', 'Overheat protection, foreign object detection'),

-- Samsung Wireless Charger Stand specs
(12, 'Output Power', '15W'),
(12, 'Input Power', '25W'),
(12, 'Compatibility', 'Samsung Galaxy series, Qi devices'),
(12, 'Connectivity', 'USB-C'),
(12, 'Cable Length', '1.5m'),
(12, 'Material', 'Plastic with cooling fan'),
(12, 'Features', 'Cooling fan, LED indicator, adjustable angle'),
(12, 'Safety', 'Overheat protection, foreign object detection'),

-- Anker PowerWave Stand specs
(13, 'Output Power', '10W'),
(13, 'Input Power', '15W'),
(13, 'Compatibility', 'Qi-enabled devices'),
(13, 'Connectivity', 'USB-C'),
(13, 'Cable Length', '1m'),
(13, 'Material', 'Plastic'),
(13, 'Features', 'LED indicator, non-slip base'),
(13, 'Safety', 'Overheat protection'),

-- Belkin Boost Charge Pro specs
(14, 'Output Power', '15W + 5W + 5W'),
(14, 'Input Power', '30W'),
(14, 'Compatibility', 'iPhone, AirPods, Apple Watch'),
(14, 'Connectivity', 'USB-C'),
(14, 'Cable Length', '1.5m'),
(14, 'Material', 'Silicone'),
(14, 'Features', '3-device charging, magnetic alignment'),
(14, 'Safety', 'Overheat protection, foreign object detection'),

-- Apple USB-C to Lightning Cable specs
(15, 'Length', '2m'),
(15, 'Connectivity', 'USB-C to Lightning'),
(15, 'Output Power', '20W'),
(15, 'Data Transfer', 'USB 2.0'),
(15, 'Material', 'Braided nylon'),
(15, 'Features', 'Fast charging, data transfer'),
(15, 'Compatibility', 'iPhone, iPad, AirPods'),

-- Anker PowerLine III USB-C Cable specs
(16, 'Length', '1.8m'),
(16, 'Connectivity', 'USB-C to USB-C'),
(16, 'Output Power', '100W'),
(16, 'Data Transfer', 'USB 3.1 Gen 2'),
(16, 'Material', 'Nylon braided'),
(16, 'Features', 'Fast charging, high-speed data transfer'),
(16, 'Compatibility', 'USB-C devices'),

-- Samsung 25W Super Fast Charger specs
(17, 'Output Power', '25W'),
(18, 'Input Power', '100-240V AC'),
(18, 'Connectivity', 'USB-C'),
(18, 'Cable Length', '1.5m'),
(18, 'Material', 'Plastic'),
(18, 'Features', 'Super Fast Charging, compact design'),
(18, 'Compatibility', 'Samsung Galaxy series'),
(18, 'Safety', 'Overheat protection, short circuit protection'),

-- Anker PowerPort III Nano specs
(19, 'Output Power', '20W'),
(19, 'Input Power', '100-240V AC'),
(19, 'Connectivity', 'USB-C'),
(19, 'Cable Length', '1m'),
(19, 'Material', 'Plastic'),
(19, 'Features', 'Compact design, fast charging'),
(19, 'Compatibility', 'USB-C devices'),
(19, 'Safety', 'Overheat protection'),

-- Spigen Tough Armor Case specs
(20, 'Material', 'TPU + Polycarbonate'),
(20, 'Compatibility', 'iPhone 15 Pro'),
(20, 'Protection', 'Military Grade'),
(20, 'Features', 'Kickstand, raised edges, precise cutouts'),
(20, 'Thickness', '2.5mm'),
(20, 'Weight', '45g'),
(20, 'Colors', 'Black, Blue, Clear'),
(20, 'Warranty', '1 year'),

-- OtterBox Defender Series specs
(21, 'Material', 'Multi-layer protection'),
(21, 'Compatibility', 'Samsung Galaxy S24'),
(21, 'Protection', 'Ultimate'),
(21, 'Features', 'Built-in screen protector, port covers'),
(21, 'Thickness', '3.5mm'),
(21, 'Weight', '65g'),
(21, 'Colors', 'Black, Blue, Pink'),
(21, 'Warranty', '1 year'),

-- Casetify Impact Case specs
(22, 'Material', 'Bio-resin'),
(22, 'Compatibility', 'Google Pixel 8'),
(22, 'Protection', 'Military Grade'),
(22, 'Features', 'MagSafe compatible, customizable'),
(22, 'Thickness', '2.8mm'),
(22, 'Weight', '50g'),
(22, 'Colors', 'Multiple options'),
(22, 'Warranty', '1 year'),

-- Apple Silicone Case specs
(23, 'Material', 'Silicone'),
(23, 'Compatibility', 'iPhone 15'),
(23, 'Protection', 'Basic'),
(23, 'Features', 'MagSafe compatible, soft-touch finish'),
(23, 'Thickness', '2mm'),
(23, 'Weight', '25g'),
(23, 'Colors', 'Multiple options'),
(23, 'Warranty', '1 year');

-- Add more product images for accessories
INSERT INTO product_images (product_id, image_url) VALUES 
-- Apple MagSafe Charger images
(11, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop'),
(11, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=horizontal'),
(11, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=vertical'),

-- Samsung Wireless Charger Stand images
(12, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop'),
(12, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=horizontal'),
(12, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=vertical'),

-- Anker PowerWave Stand images
(13, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop'),
(13, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=horizontal'),
(13, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=vertical'),

-- Belkin Boost Charge Pro images
(14, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop'),
(14, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=horizontal'),
(14, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=vertical'),

-- Apple USB-C to Lightning Cable images
(15, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop'),
(15, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=horizontal'),
(15, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=vertical'),

-- Anker PowerLine III USB-C Cable images
(16, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop'),
(16, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=horizontal'),
(16, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=vertical'),

-- Samsung 25W Super Fast Charger images
(17, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop'),
(17, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=horizontal'),
(17, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=vertical'),

-- Anker PowerPort III Nano images
(18, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop'),
(18, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=horizontal'),
(18, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=vertical'),

-- Spigen Tough Armor Case images
(19, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop'),
(19, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=horizontal'),
(19, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=vertical'),

-- OtterBox Defender Series images
(20, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop'),
(20, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=horizontal'),
(20, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=vertical'),

-- Casetify Impact Case images
(21, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop'),
(21, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=horizontal'),
(21, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=vertical'),

-- Apple Silicone Case images
(22, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop'),
(22, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=horizontal'),
(22, 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1?w=600&h=600&fit=crop&flip=vertical');

-- Add comprehensive tags for accessories
INSERT INTO product_tags (product_id, tag) VALUES 
-- Apple MagSafe Charger tags
(11, 'Apple'),
(11, 'MagSafe'),
(11, 'Wireless Charging'),
(11, 'iPhone'),
(11, 'Fast Charging'),
(11, 'Magnetic'),
(11, 'Official'),

-- Samsung Wireless Charger Stand tags
(12, 'Samsung'),
(12, 'Wireless Charging'),
(12, 'Fast Charging'),
(12, 'Cooling Fan'),
(12, 'Stand'),
(12, 'Qi'),
(12, 'Official'),

-- Anker PowerWave Stand tags
(13, 'Anker'),
(13, 'Wireless Charging'),
(13, 'Stand'),
(13, 'Qi'),
(13, 'LED Indicator'),
(13, 'Universal'),
(13, 'Value'),

-- Belkin Boost Charge Pro tags
(14, 'Belkin'),
(14, 'Wireless Charging'),
(14, '3-in-1'),
(14, 'Apple'),
(14, 'MagSafe'),
(14, 'Premium'),
(14, 'Multi-device'),

-- Apple USB-C to Lightning Cable tags
(15, 'Apple'),
(15, 'Lightning'),
(15, 'USB-C'),
(15, 'Fast Charging'),
(15, 'Data Transfer'),
(15, 'Official'),
(15, 'Braided'),

-- Anker PowerLine III USB-C Cable tags
(16, 'Anker'),
(16, 'USB-C'),
(16, 'Fast Charging'),
(16, 'Data Transfer'),
(16, 'High Speed'),
(16, 'Braided'),
(16, 'Durable'),

-- Samsung 25W Super Fast Charger tags
(17, 'Samsung'),
(17, 'Super Fast Charging'),
(17, '25W'),
(17, 'USB-C'),
(17, 'Compact'),
(17, 'Official'),
(17, 'Galaxy'),

-- Anker PowerPort III Nano tags
(18, 'Anker'),
(18, 'Fast Charging'),
(18, '20W'),
(18, 'USB-C'),
(18, 'Compact'),
(18, 'Nano'),
(18, 'Portable'),

-- Spigen Tough Armor Case tags
(19, 'Spigen'),
(19, 'Case'),
(19, 'Protection'),
(19, 'Military Grade'),
(19, 'Kickstand'),
(19, 'iPhone'),
(19, 'Durable'),

-- OtterBox Defender Series tags
(20, 'OtterBox'),
(20, 'Case'),
(20, 'Protection'),
(20, 'Ultimate'),
(20, 'Screen Protector'),
(20, 'Samsung'),
(20, 'Defender'),

-- Casetify Impact Case tags
(21, 'Casetify'),
(21, 'Case'),
(21, 'Protection'),
(21, 'MagSafe'),
(21, 'Customizable'),
(21, 'Pixel'),
(21, 'Bio-resin'),

-- Apple Silicone Case tags
(22, 'Apple'),
(22, 'Case'),
(22, 'Silicone'),
(22, 'MagSafe'),
(22, 'Soft-touch'),
(22, 'iPhone'),
(22, 'Official');
