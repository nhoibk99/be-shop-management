# Shop Management System API Documentation

## Base URL
```
http://localhost:8080/api/v1
```

## Authentication
All endpoints except `/auth/**` require JWT authentication. Include the JWT token in the Authorization header:
```
Authorization: Bearer <your-jwt-token>
```

## Endpoints

### Authentication Endpoints

#### Register User
- **POST** `/auth/register`
- **Access**: Public
- **Description**: Register a new user with CUSTOMER role
- **Request Body**:
```json
{
  "username": "string",
  "password": "string",
  "email": "string"
}
```
- **Response**:
```json
{
  "token": "jwt-token",
  "user": {
    "id": 1,
    "username": "string",
    "email": "string",
    "role": "CUSTOMER",
    "createdAt": "2024-01-01T00:00:00"
  },
  "message": "User registered successfully"
}
```

#### Login User
- **POST** `/auth/login`
- **Access**: Public
- **Description**: Authenticate user and return JWT token
- **Request Body**:
```json
{
  "username": "string",
  "password": "string"
}
```
- **Response**:
```json
{
  "token": "jwt-token",
  "user": {
    "id": 1,
    "username": "string",
    "email": "string",
    "role": "ADMIN|STAFF|CUSTOMER",
    "createdAt": "2024-01-01T00:00:00"
  },
  "message": "Login successful"
}
```

### Product Endpoints

#### Get All Products
- **GET** `/products`
- **Access**: Public
- **Description**: Get all products

#### Get Product by ID
- **GET** `/products/{id}`
- **Access**: Public
- **Description**: Get product by ID

#### Get Products by Category
- **GET** `/products/category/{categoryId}`
- **Access**: Public
- **Description**: Get all products in a specific category

#### Search Products
- **GET** `/products/search?query={searchTerm}`
- **Access**: Public
- **Description**: Search products by name or description

#### Filter Products
- **GET** `/products/filter`
- **Access**: Public
- **Description**: Filter products by multiple criteria
- **Query Parameters**:
  - `condition` (optional): NEW or USED
  - `categoryId` (optional): Category ID
  - `minPrice` (optional): Minimum price
  - `maxPrice` (optional): Maximum price
  - `inStock` (optional): true/false for stock availability
- **Example**: `/products/filter?condition=NEW&minPrice=50&maxPrice=200&inStock=true`

#### Create Product
- **POST** `/products`
- **Access**: ADMIN, STAFF
- **Description**: Create a new product
- **Request Body**:
```json
{
  "name": "string",
  "description": "string",
  "price": 99.99,
  "condition": "NEW|USED",
  "stock": 100,
  "categoryId": 1
}
```

#### Update Product
- **PUT** `/products/{id}`
- **Access**: ADMIN, STAFF
- **Description**: Update an existing product

#### Update Product Stock
- **PATCH** `/products/{id}/stock?stock={quantity}`
- **Access**: ADMIN, STAFF
- **Description**: Update product stock quantity

#### Delete Product
- **DELETE** `/products/{id}`
- **Access**: ADMIN
- **Description**: Delete a product

### Category Endpoints

#### Get All Categories
- **GET** `/categories`
- **Access**: Public
- **Description**: Get all categories

#### Get Category by ID
- **GET** `/categories/{id}`
- **Access**: Public
- **Description**: Get category by ID

#### Get Category with Products
- **GET** `/categories/{id}/products`
- **Access**: Public
- **Description**: Get category with its associated products

#### Search Categories
- **GET** `/categories/search?name={categoryName}`
- **Access**: Public
- **Description**: Search categories by name

#### Create Category
- **POST** `/categories`
- **Access**: ADMIN
- **Description**: Create a new category
- **Request Body**:
```json
{
  "name": "string"
}
```

#### Update Category
- **PUT** `/categories/{id}`
- **Access**: ADMIN
- **Description**: Update an existing category

#### Delete Category
- **DELETE** `/categories/{id}`
- **Access**: ADMIN
- **Description**: Delete a category (only if no products are associated)

### Order Endpoints

#### Get All Orders
- **GET** `/orders`
- **Access**: ADMIN, STAFF
- **Description**: Get all orders

#### Get Order by ID
- **GET** `/orders/{id}`
- **Access**: Authenticated (own orders) or ADMIN/STAFF (all orders)
- **Description**: Get order by ID

#### Get My Orders
- **GET** `/orders/my-orders`
- **Access**: Authenticated
- **Description**: Get current user's orders

#### Get Orders by Status
- **GET** `/orders/status/{status}`
- **Access**: ADMIN, STAFF
- **Description**: Get orders with specific status (PENDING, CONFIRMED, SHIPPED, DELIVERED, CANCELLED)

#### Create Order
- **POST** `/orders`
- **Access**: Authenticated
- **Description**: Create a new order with automatic stock validation and updates
- **Request Body**:
```json
{
  "orderItems": [
    {
      "productId": 1,
      "quantity": 2,
      "price": 99.99
    }
  ]
}
```
- **Features**:
  - ✅ Automatic total amount calculation
  - ✅ Stock validation before order creation
  - ✅ Automatic stock decrease from inventory
  - ✅ Transaction safety with rollback on errors

#### Update Order Status
- **PUT** `/orders/{id}/status?status={status}`
- **Access**: ADMIN, STAFF
- **Description**: Update order status (PENDING, CONFIRMED, SHIPPED, DELIVERED, CANCELLED)

#### Update Order
- **PUT** `/orders/{id}`
- **Access**: ADMIN, STAFF
- **Description**: Update an existing order (items, quantities, etc.)

#### Delete Order
- **DELETE** `/orders/{id}`
- **Access**: ADMIN
- **Description**: Delete an order and restore stock if not already cancelled

### User Management Endpoints

#### Get All Users
- **GET** `/users`
- **Access**: ADMIN
- **Description**: Get all users

#### Get User by ID
- **GET** `/users/{id}`
- **Access**: ADMIN
- **Description**: Get user by ID

#### Create User
- **POST** `/users`
- **Access**: ADMIN
- **Description**: Create a new user
- **Request Body**:
```json
{
  "username": "string",
  "password": "string",
  "email": "string",
  "role": "ADMIN|STAFF|CUSTOMER"
}
```

#### Update User
- **PUT** `/users/{id}`
- **Access**: ADMIN
- **Description**: Update an existing user

#### Delete User
- **DELETE** `/users/{id}`
- **Access**: ADMIN
- **Description**: Delete a user

### Inventory Endpoints

#### Get All Inventory
- **GET** `/inventory`
- **Access**: ADMIN, STAFF
- **Description**: Get all inventory records

#### Get Inventory by ID
- **GET** `/inventory/{id}`
- **Access**: ADMIN, STAFF
- **Description**: Get inventory by ID

#### Get Inventory by Product ID
- **GET** `/inventory/product/{productId}`
- **Access**: ADMIN, STAFF
- **Description**: Get inventory for a specific product

#### Get Low Stock Items
- **GET** `/inventory/low-stock?threshold={number}`
- **Access**: ADMIN, STAFF
- **Description**: Get inventory items with stock below threshold (default: 10)

#### Create Inventory
- **POST** `/inventory`
- **Access**: ADMIN, STAFF
- **Description**: Create a new inventory record
- **Request Body**:
```json
{
  "productId": 1,
  "stock": 100
}
```

#### Update Inventory
- **PUT** `/inventory/{id}`
- **Access**: ADMIN, STAFF
- **Description**: Update an existing inventory record

#### Update Stock by ID
- **PUT** `/inventory/{id}/stock?stock={quantity}`
- **Access**: ADMIN, STAFF
- **Description**: Update stock quantity for an inventory record

#### Update Stock by Product
- **PUT** `/inventory/product/{productId}/stock?stock={quantity}`
- **Access**: ADMIN, STAFF
- **Description**: Update stock quantity for a product

#### Decrease Stock
- **PUT** `/inventory/product/{productId}/decrease?quantity={amount}`
- **Access**: ADMIN, STAFF
- **Description**: Decrease stock quantity (used when orders are placed)

#### Delete Inventory
- **DELETE** `/inventory/{id}`
- **Access**: ADMIN
- **Description**: Delete an inventory record

## Product Condition Field

The Product entity includes a clear `condition` field that can be either:
- **NEW**: Brand new products
- **USED**: Previously owned products

This field is used in:
- Product creation and updates
- Product filtering
- Product display

## Inventory Management

### Automatic Stock Updates
When an order is placed:
1. Product stock is automatically decreased
2. Inventory records are updated
3. Stock validation prevents overselling

### Stock Monitoring
- Low stock alerts for items below threshold
- Real-time stock tracking
- Stock history with timestamps

## Role-Based Access Control

### ADMIN Role
- Full access to all endpoints
- Can manage users, products, categories, orders, and inventory
- Can delete any resource

### STAFF Role
- Can manage products (create, update, but not delete)
- Can manage orders (view all, update status)
- Can manage inventory (view, update stock)
- Cannot manage users or delete products

### CUSTOMER Role
- Can view products and categories
- Can create and view their own orders
- Cannot access admin or staff endpoints

## Default Users

The system creates default users on startup:

- **Admin User**:
  - Username: `admin`
  - Password: `admin123`
  - Role: `ADMIN`

- **Staff User**:
  - Username: `staff`
  - Password: `staff123`
  - Role: `STAFF`

## Default Categories

The system creates default categories on startup:
- Electronics
- Clothing
- Books
- Home & Garden

## Error Responses

All endpoints return appropriate HTTP status codes:

- `200 OK`: Success
- `201 Created`: Resource created successfully
- `400 Bad Request`: Invalid request data
- `401 Unauthorized`: Authentication required
- `403 Forbidden`: Insufficient permissions
- `404 Not Found`: Resource not found
- `500 Internal Server Error`: Server error

Error response format:
```json
{
  "error": "Error message",
  "timestamp": "2024-01-01T00:00:00",
  "path": "/api/v1/endpoint"
}
```

## Example API Usage

### Filter Products
```bash
# Get all NEW products between $50-$200 that are in stock
curl -X GET "http://localhost:8080/api/v1/products/filter?condition=NEW&minPrice=50&maxPrice=200&inStock=true"
```

### Create Product
```bash
curl -X POST http://localhost:8080/api/v1/products \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "iPhone 15",
    "description": "Latest iPhone model",
    "price": 999.99,
    "condition": "NEW",
    "stock": 50,
    "categoryId": 1
  }'
```

### Update Inventory Stock
```bash
curl -X PUT "http://localhost:8080/api/v1/inventory/product/1/stock?stock=25" \
  -H "Authorization: Bearer <token>"
```
