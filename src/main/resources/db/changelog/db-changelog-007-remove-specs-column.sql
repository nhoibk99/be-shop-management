--liquibase formatted sql

--changeset shop-management:007
--comment: Remove the old specs column after data migration (OPTIONAL - uncomment when ready)

-- IMPORTANT: Only uncomment and run this migration AFTER you have verified that 
-- all specs data has been successfully migrated to the product_specifications table
-- and you no longer need the old specs column.

-- Uncomment the following line when you're ready to remove the specs column:
-- ALTER TABLE products DROP COLUMN specs;

-- To verify the migration was successful, you can run these queries:
-- SELECT COUNT(*) FROM products WHERE specs IS NOT NULL; -- Should show existing specs
-- SELECT COUNT(*) FROM product_specifications; -- Should show migrated specifications
-- SELECT p.id, p.name, ps.spec_key, ps.spec_value 
-- FROM products p 
-- LEFT JOIN product_specifications ps ON p.id = ps.product_id 
-- WHERE p.specs IS NOT NULL 
-- ORDER BY p.id, ps.spec_key;
