--liquibase formatted sql

--changeset shop-management:009
--comment: Add additional sample data for reviews, orders, and other tables

-- Add more reviews for various products
INSERT INTO reviews (product_id, author_name, rating, comment, created_at) VALUES 
-- Reviews for iPhone 15 Pro Max
(1, 'Sarah Johnson', 5, 'Absolutely love this phone! The camera quality is outstanding and the titanium design feels premium. Battery life is excellent too.', '2025-09-07 10:15:00'),
(1, 'Mike Chen', 4, 'Great phone but quite expensive. The A17 Pro chip is incredibly fast and the camera system is top-notch.', '2025-09-06 08:45:00'),
(1, 'Emily Davis', 5, 'Best iPhone I have ever owned. The display is gorgeous and the performance is smooth.', '2025-09-05 14:30:00'),
(1, 'David Wilson', 4, 'Love the titanium build and camera quality. Only downside is the price point.', '2025-09-04 16:20:00'),

-- Reviews for Samsung Galaxy S24 Ultra
(2, 'Alex Rodriguez', 5, 'The S Pen is amazing for taking notes and the camera quality is incredible. Great for productivity.', '2025-09-07 09:20:00'),
(2, 'Lisa Thompson', 4, 'Excellent phone with great features. The AI capabilities are impressive.', '2025-09-06 16:10:00'),
(2, 'James Brown', 5, 'Love the large screen and S Pen functionality. Perfect for my work needs.', '2025-09-05 11:45:00'),
(2, 'Maria Garcia', 4, 'Great phone but wish it had better battery optimization.', '2025-09-04 13:25:00'),

-- Reviews for Google Pixel 8 Pro
(3, 'John Smith', 5, 'Google AI features are amazing. The camera processing is incredible and the clean Android experience is perfect.', '2025-09-07 11:45:00'),
(3, 'Anna Lee', 4, 'Great camera and AI features. The phone feels premium and performs well.', '2025-09-06 14:30:00'),
(3, 'Robert Taylor', 5, 'Best Android phone I have used. The AI integration is seamless.', '2025-09-05 10:15:00'),
(3, 'Jennifer White', 4, 'Love the camera quality and AI features. Battery life could be better.', '2025-09-04 15:45:00'),

-- Reviews for OnePlus 12
(4, 'Kevin Park', 5, 'OnePlus never disappoints. Fast charging, great performance, and Hasselblad camera.', '2025-09-07 12:30:00'),
(4, 'Rachel Green', 4, 'Excellent phone with fast charging. The camera quality is impressive.', '2025-09-06 09:15:00'),
(4, 'Tom Anderson', 5, 'Love the fast charging and clean OxygenOS. Great value for money.', '2025-09-05 17:20:00'),
(4, 'Samantha Clark', 4, 'Great performance and fast charging. The design is sleek and modern.', '2025-09-04 12:10:00'),

-- Reviews for Xiaomi 14 Ultra
(5, 'Daniel Kim', 5, 'Leica camera system is incredible. The phone feels premium and performs excellently.', '2025-09-07 13:45:00'),
(5, 'Michelle Wang', 4, 'Great camera quality and performance. MIUI is feature-rich but takes getting used to.', '2025-09-06 11:30:00'),
(5, 'Chris Johnson', 5, 'Amazing camera system and build quality. Worth every penny.', '2025-09-05 16:15:00'),
(5, 'Amanda Davis', 4, 'Excellent phone with great camera. The Leica partnership really shows.', '2025-09-04 14:20:00'),

-- Reviews for ASUS ROG Phone 8 Pro
(6, 'GamingPro123', 5, 'Ultimate gaming phone! The cooling system works great and the performance is unmatched.', '2025-09-07 15:30:00'),
(6, 'MobileGamer', 4, 'Great for gaming but quite heavy. The cooling system is impressive.', '2025-09-06 18:45:00'),
(6, 'TechReviewer', 5, 'Best gaming phone on the market. The RGB lighting and gaming features are amazing.', '2025-09-05 20:15:00'),
(6, 'GameMaster', 4, 'Excellent gaming performance but battery drains quickly during intense gaming.', '2025-09-04 19:30:00'),

-- Reviews for Samsung Galaxy A55
(7, 'BudgetBuyer', 5, 'Great value for money! The camera quality is impressive for this price range.', '2025-09-07 14:20:00'),
(7, 'SmartShopper', 4, 'Good mid-range phone with decent performance. Camera is better than expected.', '2025-09-06 10:45:00'),
(7, 'ValueSeeker', 5, 'Excellent phone for the price. Samsung quality at an affordable price point.', '2025-09-05 13:15:00'),
(7, 'TechEnthusiast', 4, 'Solid mid-range phone with good build quality and performance.', '2025-09-04 16:30:00'),

-- Reviews for accessories
(9, 'AccessoryLover', 5, 'Perfect wireless charger for my iPhone. Charges fast and the magnetic connection is strong.', '2025-09-07 11:20:00'),
(9, 'TechUser', 4, 'Good wireless charger but a bit expensive. Works well with MagSafe.', '2025-09-06 15:45:00'),
(9, 'iPhoneUser', 5, 'Love the convenience of wireless charging. The magnetic alignment is perfect.', '2025-09-05 09:30:00'),

(10, 'SamsungFan', 5, 'Great wireless charger for Samsung phones. The cooling fan is a nice touch.', '2025-09-07 12:15:00'),
(10, 'WirelessCharger', 4, 'Good charging speed and the stand design is convenient.', '2025-09-06 14:20:00'),
(10, 'TechReviewer2', 5, 'Excellent wireless charger with fast charging and good build quality.', '2025-09-05 11:45:00'),

(11, 'AnkerFan', 5, 'Anker never disappoints. Great wireless charger at a reasonable price.', '2025-09-07 13:30:00'),
(11, 'BudgetBuyer2', 4, 'Good value wireless charger. Works well with most phones.', '2025-09-06 16:15:00'),
(11, 'TechEnthusiast2', 5, 'Reliable wireless charger with good charging speed.', '2025-09-05 10:20:00'),

(12, 'AppleEcosystem', 5, 'Perfect 3-in-1 charger for Apple devices. Charges everything at once.', '2025-09-07 14:45:00'),
(12, 'MultiDevice', 4, 'Convenient charger for multiple devices. A bit expensive but worth it.', '2025-09-06 12:30:00'),
(12, 'AppleUser', 5, 'Love being able to charge all my Apple devices in one place.', '2025-09-05 15:15:00');

-- Add sample orders
INSERT INTO orders (user_id, status, total_amount, shipping_address, shipping_method, payment_method) VALUES 
(3, 'CONFIRMED', 1199.99, '123 Main St, New York, NY 10001', 'Standard Shipping', 'Credit Card'),
(4, 'SHIPPED', 899.99, '456 Oak Ave, Los Angeles, CA 90210', 'Express Shipping', 'PayPal'),
(5, 'DELIVERED', 649.99, '789 Pine St, Chicago, IL 60601', 'Standard Shipping', 'Credit Card'),
(6, 'PENDING', 1299.99, '321 Elm St, Houston, TX 77001', 'Express Shipping', 'Credit Card'),
(7, 'CONFIRMED', 799.99, '654 Maple Ave, Phoenix, AZ 85001', 'Standard Shipping', 'PayPal'),
(8, 'SHIPPED', 399.99, '987 Cedar St, Philadelphia, PA 19101', 'Standard Shipping', 'Credit Card'),
(9, 'DELIVERED', 1499.99, '147 Birch St, San Antonio, TX 78201', 'Express Shipping', 'Credit Card'),
(10, 'PENDING', 599.99, '258 Spruce Ave, San Diego, CA 92101', 'Standard Shipping', 'PayPal'),
(11, 'CONFIRMED', 999.99, '369 Willow St, Dallas, TX 75201', 'Express Shipping', 'Credit Card'),
(12, 'SHIPPED', 299.99, '741 Poplar Ave, San Jose, CA 95101', 'Standard Shipping', 'Credit Card');

-- Add sample order items
INSERT INTO order_items (order_id, product_id, quantity, unit_price, total_price) VALUES 
-- Order 1: iPhone 15 Pro Max
(1, 1, 1, 1199.99, 1199.99),

-- Order 2: Samsung Galaxy S24 Ultra + accessories
(2, 2, 1, 1299.99, 1299.99),
(2, 9, 1, 39.00, 39.00),
(2, 13, 1, 19.99, 19.99),

-- Order 3: Google Pixel 8 Pro
(3, 3, 1, 999.00, 999.00),

-- Order 4: OnePlus 12 + case
(4, 4, 1, 799.99, 799.99),
(4, 17, 1, 19.99, 19.99),

-- Order 5: Xiaomi 14 Ultra
(5, 5, 1, 1199.99, 1199.99),

-- Order 6: ASUS ROG Phone 8 Pro
(6, 6, 1, 1199.99, 1199.99),

-- Order 7: Samsung Galaxy A55 + accessories
(7, 7, 1, 399.99, 399.99),
(7, 10, 1, 59.99, 59.99),
(7, 18, 1, 49.99, 49.99),

-- Order 8: RedMagic 9 Pro
(8, 8, 1, 649.99, 649.99),

-- Order 9: OnePlus Nord 3 + accessories
(9, 11, 1, 449.99, 449.99),
(9, 19, 1, 39.99, 39.99),
(9, 20, 1, 12.99, 12.99),

-- Order 10: Google Pixel 7a
(10, 12, 1, 499.99, 499.99);

-- Add more product images
INSERT INTO product_images (product_id, image_url) VALUES 
-- iPhone 15 Pro Max additional images
(1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=600&h=600&fit=crop&flip=horizontal'),
(1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=600&h=600&fit=crop&flip=vertical'),
(1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=600&h=600&fit=crop&flip=both'),

-- Samsung Galaxy S24 Ultra additional images
(2, 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=600&h=600&fit=crop&flip=horizontal'),
(2, 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=600&h=600&fit=crop&flip=vertical'),
(2, 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=600&h=600&fit=crop&flip=both'),

-- Google Pixel 8 Pro additional images
(3, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=600&h=600&fit=crop&flip=horizontal'),
(3, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=600&h=600&fit=crop&flip=vertical'),
(3, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=600&h=600&fit=crop&flip=both'),

-- OnePlus 12 additional images
(4, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=600&h=600&fit=crop&flip=horizontal'),
(4, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=600&h=600&fit=crop&flip=vertical'),
(4, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=600&h=600&fit=crop&flip=both'),

-- Xiaomi 14 Ultra additional images
(5, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=600&h=600&fit=crop&flip=horizontal'),
(5, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=600&h=600&fit=crop&flip=vertical'),
(5, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=600&h=600&fit=crop&flip=both');

-- Add more product tags
INSERT INTO product_tags (product_id, tag) VALUES 
-- iPhone 15 Pro Max tags
(1, 'Flagship'),
(1, 'Premium'),
(1, 'Camera Focused'),
(1, 'Titanium'),

-- Samsung Galaxy S24 Ultra tags
(2, 'Flagship'),
(2, 'S Pen'),
(2, 'AI Powered'),
(2, 'Professional'),

-- Google Pixel 8 Pro tags
(3, 'AI Powered'),
(3, 'Camera Focused'),
(3, 'Clean Android'),
(3, 'Google'),

-- OnePlus 12 tags
(4, 'Fast Charging'),
(4, 'Hasselblad'),
(4, 'Performance'),
(4, 'Value'),

-- Xiaomi 14 Ultra tags
(5, 'Leica'),
(5, 'Camera Focused'),
(5, 'Premium'),
(5, 'Photography'),

-- ASUS ROG Phone 8 Pro tags
(6, 'Gaming'),
(6, 'Performance'),
(6, 'RGB'),
(6, 'Cooling'),

-- Samsung Galaxy A55 tags
(7, 'Mid-range'),
(7, 'Value'),
(7, 'Samsung'),
(7, 'Reliable'),

-- RedMagic 9 Pro tags
(8, 'Gaming'),
(8, 'Cooling'),
(8, 'Performance'),
(8, 'Budget Gaming'),

-- OnePlus Nord 3 tags
(9, 'Mid-range'),
(9, 'OnePlus'),
(9, 'Performance'),
(9, 'Value'),

-- Google Pixel 7a tags
(10, 'Mid-range'),
(10, 'Google'),
(10, 'Camera'),
(10, 'Clean Android');

-- Add more product specifications
INSERT INTO product_specifications (product_id, spec_key, spec_value) VALUES 
-- iPhone 15 Pro Max additional specs
(1, 'Weight', '221g'),
(1, 'Dimensions', '159.9 x 76.7 x 8.25 mm'),
(1, 'Water Resistance', 'IP68'),
(1, 'Wireless Charging', 'MagSafe + Qi'),
(1, 'Face ID', 'Yes'),
(1, '5G', 'Yes'),

-- Samsung Galaxy S24 Ultra additional specs
(2, 'Weight', '232g'),
(2, 'Dimensions', '162.3 x 79.0 x 8.6 mm'),
(2, 'Water Resistance', 'IP68'),
(2, 'Wireless Charging', 'Qi + Reverse'),
(2, 'Biometrics', 'Ultrasonic Fingerprint + Face'),
(2, '5G', 'Yes'),
(2, 'S Pen', 'Yes'),

-- Google Pixel 8 Pro additional specs
(3, 'Weight', '213g'),
(3, 'Dimensions', '162.6 x 76.5 x 8.8 mm'),
(3, 'Water Resistance', 'IP68'),
(3, 'Wireless Charging', 'Qi + Reverse'),
(3, 'Biometrics', 'Optical Fingerprint + Face'),
(3, '5G', 'Yes'),
(3, 'AI Features', 'Call Screen, Magic Eraser'),

-- OnePlus 12 additional specs
(4, 'Weight', '220g'),
(4, 'Dimensions', '164.3 x 75.8 x 9.15 mm'),
(4, 'Water Resistance', 'IP65'),
(4, 'Wireless Charging', 'Qi + Reverse'),
(4, 'Biometrics', 'Optical Fingerprint + Face'),
(4, '5G', 'Yes'),
(4, 'Fast Charging', '100W SuperVOOC'),

-- Xiaomi 14 Ultra additional specs
(5, 'Weight', '224.4g'),
(5, 'Dimensions', '161.2 x 75.3 x 9.2 mm'),
(5, 'Water Resistance', 'IP68'),
(5, 'Wireless Charging', 'Qi + Reverse'),
(5, 'Biometrics', 'Optical Fingerprint + Face'),
(5, '5G', 'Yes'),
(5, 'Leica Camera', 'Professional Mode');
