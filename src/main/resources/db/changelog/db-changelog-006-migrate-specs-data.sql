--liquibase formatted sql

--changeset shop-management:006
--comment: Migrate specs JSON data from products.specs to product_specifications table

-- Insert specifications from JSON specs field into product_specifications table
-- This extracts key-value pairs from the JSON specs field and inserts them as separate rows

-- For products with specs containing storage, color, screenSize
INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT 
    id as product_id,
    'Storage' as spec_key,
    specs::json->>'storage' as spec_value
FROM products 
WHERE specs IS NOT NULL 
  AND specs::json->>'storage' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT 
    id as product_id,
    'Color' as spec_key,
    specs::json->>'color' as spec_value
FROM products 
WHERE specs IS NOT NULL 
  AND specs::json->>'color' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT 
    id as product_id,
    'Screen Size' as spec_key,
    specs::json->>'screenSize' as spec_value
FROM products 
WHERE specs IS NOT NULL 
  AND specs::json->>'screenSize' IS NOT NULL;

-- For products with specs containing processor, ram, camera, battery, os
INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT 
    id as product_id,
    'Processor' as spec_key,
    specs::json->>'processor' as spec_value
FROM products 
WHERE specs IS NOT NULL 
  AND specs::json->>'processor' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT 
    id as product_id,
    'RAM' as spec_key,
    specs::json->>'ram' as spec_value
FROM products 
WHERE specs IS NOT NULL 
  AND specs::json->>'ram' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT 
    id as product_id,
    'Camera' as spec_key,
    specs::json->>'camera' as spec_value
FROM products 
WHERE specs IS NOT NULL 
  AND specs::json->>'camera' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT 
    id as product_id,
    'Battery' as spec_key,
    specs::json->>'battery' as spec_value
FROM products 
WHERE specs IS NOT NULL 
  AND specs::json->>'battery' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT 
    id as product_id,
    'OS' as spec_key,
    specs::json->>'os' as spec_value
FROM products 
WHERE specs IS NOT NULL 
  AND specs::json->>'os' IS NOT NULL;

-- For accessories with different spec keys
INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT 
    id as product_id,
    'Connectivity' as spec_key,
    specs::json->>'connectivity' as spec_value
FROM products 
WHERE specs IS NOT NULL 
  AND specs::json->>'connectivity' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT 
    id as product_id,
    'Size' as spec_key,
    specs::json->>'size' as spec_value
FROM products 
WHERE specs IS NOT NULL 
  AND specs::json->>'size' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT 
    id as product_id,
    'Capacity' as spec_key,
    specs::json->>'capacity' as spec_value
FROM products 
WHERE specs IS NOT NULL 
  AND specs::json->>'capacity' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT 
    id as product_id,
    'Output' as spec_key,
    specs::json->>'output' as spec_value
FROM products 
WHERE specs IS NOT NULL 
  AND specs::json->>'output' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT 
    id as product_id,
    'Material' as spec_key,
    specs::json->>'material' as spec_value
FROM products 
WHERE specs IS NOT NULL 
  AND specs::json->>'material' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT 
    id as product_id,
    'Compatibility' as spec_key,
    specs::json->>'compatibility' as spec_value
FROM products 
WHERE specs IS NOT NULL 
  AND specs::json->>'compatibility' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT 
    id as product_id,
    'Hardness' as spec_key,
    specs::json->>'hardness' as spec_value
FROM products 
WHERE specs IS NOT NULL 
  AND specs::json->>'hardness' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT 
    id as product_id,
    'Thickness' as spec_key,
    specs::json->>'thickness' as spec_value
FROM products 
WHERE specs IS NOT NULL 
  AND specs::json->>'thickness' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT 
    id as product_id,
    'Ports' as spec_key,
    specs::json->>'ports' as spec_value
FROM products 
WHERE specs IS NOT NULL 
  AND specs::json->>'ports' IS NOT NULL;
