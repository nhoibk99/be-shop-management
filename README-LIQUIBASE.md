# Liquibase Database Migration

This project uses Liquibase for database schema management and sample data initialization.

## Files Structure

```
src/main/resources/db/changelog/
├── db-changelog-master.xml          # Master changelog file
├── db-changelog-001-initial-schema.sql    # Database schema creation
└── db-changelog-002-sample-data.sql       # Sample data insertion
```

## Database Schema

### Tables Created

1. **categories** - Product categories (Smartphones, Tablets, etc.)
2. **users** - User accounts with roles (ADMIN, STAFF, CUSTOMER)
3. **products** - Product information with specs, labels, and conditions
4. **orders** - Customer orders with shipping and payment details
5. **order_items** - Individual items in each order
6. **inventory** - Product stock management

### Key Features

- **JSONB specs** - Flexible product specifications storage
- **Product labels** - NEW, OLD, SALE, FEATURED labels
- **Condition tracking** - NEW vs USED products
- **Foreign key constraints** - Data integrity
- **Indexes** - Performance optimization

## Sample Data

### Categories (9 categories)
- Smartphones, Tablets, Chargers, Headphones, Cases, Screen Protectors, Power Banks, Smartwatches, Earbuds

### Users (4 users)
- **admin** - Admin user (password: password123)
- **staff1** - Staff user (password: password123)
- **customer1** - Customer user (password: password123)
- **john_doe** - Customer user (password: password123)

### Products
- **New Phones (8 products)** - Latest smartphones from Samsung, Apple, Google, etc.
- **Used Phones (8 products)** - Pre-owned smartphones in various conditions
- **Accessories (8 products)** - Cases, chargers, earbuds, smartwatches, etc.

### Sample Orders
- 2 sample orders with different statuses and shipping methods

## Usage

### 1. Database Setup

Ensure PostgreSQL is running and create the database:

```sql
CREATE DATABASE shop_management;
```

### 2. Application Configuration

The application is configured to use Liquibase automatically:

```yaml
spring:
  liquibase:
    enabled: true
    change-log: classpath:db/changelog/db-changelog-master.xml
    contexts: dev
```

### 3. Running Migrations

Migrations run automatically when the application starts. Liquibase will:

1. Create all tables and constraints
2. Insert sample data
3. Track changes in `DATABASECHANGELOG` table

### 4. Manual Liquibase Commands

If you need to run Liquibase manually:

```bash
# Check status
liquibase status

# Update database
liquibase update

# Rollback to specific version
liquibase rollback <tag>

# Generate SQL without executing
liquibase updateSQL
```

## Data Mapping

### Frontend to Database

The sample data in the frontend components maps to:

- **NewPhones.tsx** → Products with `condition = 'NEW'` and `label = 'new'`
- **UsedPhones.tsx** → Products with `condition = 'USED'` and `label = 'old'`
- **Accessories.tsx** → Products in categories 3-9 (Chargers, Headphones, etc.)
- **Cart.tsx** → Orders and order_items tables

### Product Structure

```sql
{
  "storage": "256GB",
  "color": "Phantom Black", 
  "screenSize": "6.8\" AMOLED"
}
```

## Security

- Passwords are BCrypt encoded
- JWT authentication enabled
- Role-based access control

## Notes

- **ddl-auto: none** - Hibernate won't auto-create tables
- **Liquibase enabled** - Database changes managed by Liquibase
- **Sample data** - Realistic data for development and testing
- **JSONB specs** - Flexible product specifications for different categories

## Troubleshooting

### Common Issues

1. **Database connection** - Check PostgreSQL is running
2. **Permission errors** - Ensure user has CREATE privileges
3. **Duplicate data** - Liquibase tracks changes, won't re-run

### Reset Database

To reset and re-run all migrations:

```sql
DROP DATABASE shop_management;
CREATE DATABASE shop_management;
```

Then restart the application.
