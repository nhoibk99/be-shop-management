-- Add sample data for extended product features

-- Update existing products with old prices and warranty policies
UPDATE products SET old_price = 1299.99, warranty_and_return_policy = '1 year manufacturer warranty. 14-day return policy for unused items.' WHERE id = 1;
UPDATE products SET old_price = 1099.00, warranty_and_return_policy = '1 year Apple warranty. 14-day return policy.' WHERE id = 2;
UPDATE products SET old_price = 999.00, warranty_and_return_policy = '1 year Google warranty. 15-day return policy.' WHERE id = 3;

-- Add sample images for products
INSERT INTO product_images (product_id, image_url) VALUES 
(1, 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=400&h=400&fit=crop'),
(1, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop'),
(2, 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop'),
(2, 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=400&h=400&fit=crop');

-- Add sample tags for products
INSERT INTO product_tags (product_id, tag) VALUES 
(1, 'New Arrival'),
(1, 'Best Seller'),
(2, 'Premium'),
(2, 'Latest'),
(3, 'AI Powered'),
(3, 'Camera Focused');

-- Add sample specifications
INSERT INTO product_specifications (product_id, spec_key, spec_value) VALUES 
(1, 'Display', '6.8" AMOLED'),
(1, 'Battery', '5000mAh'),
(1, 'Storage', '256GB'),
(1, 'Processor', 'Snapdragon 8 Gen 3'),
(1, 'Material', 'Titanium Frame'),
(2, 'Display', '6.1" Super Retina XDR'),
(2, 'Battery', '3274mAh'),
(2, 'Storage', '128GB'),
(2, 'Processor', 'A17 Pro'),
(2, 'Material', 'Titanium'),
(3, 'Display', '6.7" OLED'),
(3, 'Battery', '5050mAh'),
(3, 'Storage', '128GB'),
(3, 'Processor', 'Google Tensor G3'),
(3, 'Material', 'Aluminum');

-- Add sample reviews
INSERT INTO reviews (product_id, author_name, rating, comment, created_at) VALUES 
(1, 'Alice Johnson', 5, 'Amazing phone! The camera quality is outstanding and the battery lasts all day.', '2025-09-07 10:15:00'),
(1, 'Bob Smith', 4, 'Very good phone but a bit pricey. The performance is excellent though.', '2025-09-06 08:45:00'),
(1, 'Carol Davis', 5, 'Love the S Pen feature! Perfect for taking notes and drawing.', '2025-09-05 14:30:00'),
(2, 'David Wilson', 5, 'The titanium design feels premium and the A17 Pro chip is incredibly fast.', '2025-09-07 09:20:00'),
(2, 'Emma Brown', 4, 'Great phone but the price is quite high. Camera quality is excellent.', '2025-09-06 16:10:00'),
(3, 'Frank Miller', 4, 'Google AI features are impressive. The camera processing is amazing.', '2025-09-07 11:45:00'),
(3, 'Grace Lee', 5, 'Best Android phone I have ever used. Highly recommended!', '2025-09-05 13:25:00');
