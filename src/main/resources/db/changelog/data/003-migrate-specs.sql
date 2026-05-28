--liquibase formatted sql

--changeset shop-management:data-003
--comment: Migrate specs JSON field to product_specifications table

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT id, 'Storage', specs::json->>'storage' FROM products WHERE specs IS NOT NULL AND specs::json->>'storage' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT id, 'Color', specs::json->>'color' FROM products WHERE specs IS NOT NULL AND specs::json->>'color' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT id, 'Screen Size', specs::json->>'screenSize' FROM products WHERE specs IS NOT NULL AND specs::json->>'screenSize' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT id, 'Processor', specs::json->>'processor' FROM products WHERE specs IS NOT NULL AND specs::json->>'processor' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT id, 'RAM', specs::json->>'ram' FROM products WHERE specs IS NOT NULL AND specs::json->>'ram' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT id, 'Camera', specs::json->>'camera' FROM products WHERE specs IS NOT NULL AND specs::json->>'camera' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT id, 'Battery', specs::json->>'battery' FROM products WHERE specs IS NOT NULL AND specs::json->>'battery' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT id, 'OS', specs::json->>'os' FROM products WHERE specs IS NOT NULL AND specs::json->>'os' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT id, 'Connectivity', specs::json->>'connectivity' FROM products WHERE specs IS NOT NULL AND specs::json->>'connectivity' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT id, 'Size', specs::json->>'size' FROM products WHERE specs IS NOT NULL AND specs::json->>'size' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT id, 'Capacity', specs::json->>'capacity' FROM products WHERE specs IS NOT NULL AND specs::json->>'capacity' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT id, 'Output', specs::json->>'output' FROM products WHERE specs IS NOT NULL AND specs::json->>'output' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT id, 'Material', specs::json->>'material' FROM products WHERE specs IS NOT NULL AND specs::json->>'material' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT id, 'Compatibility', specs::json->>'compatibility' FROM products WHERE specs IS NOT NULL AND specs::json->>'compatibility' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT id, 'Hardness', specs::json->>'hardness' FROM products WHERE specs IS NOT NULL AND specs::json->>'hardness' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT id, 'Thickness', specs::json->>'thickness' FROM products WHERE specs IS NOT NULL AND specs::json->>'thickness' IS NOT NULL;

INSERT INTO product_specifications (product_id, spec_key, spec_value)
SELECT id, 'Ports', specs::json->>'ports' FROM products WHERE specs IS NOT NULL AND specs::json->>'ports' IS NOT NULL;
