# Order Management API Documentation

## Overview
The Order Management API provides comprehensive functionality for creating, managing, and tracking orders in the shop management system. It includes automatic stock management, order status tracking, and role-based access control.

## Base URL
```
http://localhost:8080/api/v1/orders
```

## Authentication
All order endpoints require JWT authentication. Include the JWT token in the Authorization header:
```
Authorization: Bearer <your-jwt-token>
```

## Order Status Values
- **PENDING**: Order has been created but not yet confirmed
- **CONFIRMED**: Order has been confirmed by staff/admin
- **SHIPPED**: Order has been shipped to customer
- **DELIVERED**: Order has been delivered to customer
- **CANCELLED**: Order has been cancelled

## Endpoints

### 1. Create New Order
**POST** `/orders`

**Access**: Authenticated users (CUSTOMER, STAFF, ADMIN)

**Description**: Creates a new order with automatic stock validation and updates.

**Request Body**:
```json
{
  "orderItems": [
    {
      "productId": 1,
      "quantity": 2,
      "price": 99.99
    },
    {
      "productId": 3,
      "quantity": 1,
      "price": 149.99
    }
  ]
}
```

**Response**:
```json
{
  "id": 1,
  "userId": 5,
  "status": "PENDING",
  "totalAmount": 349.97,
  "createdAt": "2024-01-01T10:30:00",
  "orderItems": [
    {
      "id": 1,
      "productId": 1,
      "quantity": 2,
      "price": 99.99,
      "productName": "iPhone 15"
    },
    {
      "id": 2,
      "productId": 3,
      "quantity": 1,
      "price": 149.99,
      "productName": "MacBook Pro"
    }
  ]
}
```

**Features**:
- ✅ Automatic total amount calculation
- ✅ Stock validation before order creation
- ✅ Automatic stock decrease from inventory
- ✅ Order status set to PENDING by default
- ✅ Transaction safety with rollback on errors

### 2. Get All Orders (Admin/Staff Only)
**GET** `/orders`

**Access**: ADMIN, STAFF

**Description**: Retrieves all orders in the system.

**Response**:
```json
[
  {
    "id": 1,
    "userId": 5,
    "status": "PENDING",
    "totalAmount": 349.97,
    "createdAt": "2024-01-01T10:30:00",
    "orderItems": [...]
  }
]
```

### 3. Get Order by ID
**GET** `/orders/{id}`

**Access**: 
- Users can view their own orders
- ADMIN/STAFF can view any order

**Description**: Retrieves a specific order by ID.

**Response**: Same as order creation response

### 4. Get My Orders
**GET** `/orders/my-orders`

**Access**: Authenticated users

**Description**: Retrieves all orders for the current authenticated user.

**Response**: Array of order objects

### 5. Get Orders by Status (Admin/Staff Only)
**GET** `/orders/status/{status}`

**Access**: ADMIN, STAFF

**Description**: Retrieves all orders with a specific status.

**Example**: `/orders/status/PENDING`

**Response**: Array of order objects with the specified status

### 6. Update Order Status (Admin/Staff Only)
**PUT** `/orders/{id}/status?status={newStatus}`

**Access**: ADMIN, STAFF

**Description**: Updates the status of an existing order.

**Query Parameters**:
- `status`: New order status (PENDING, CONFIRMED, SHIPPED, DELIVERED, CANCELLED)

**Example**:
```bash
curl -X PUT "http://localhost:8080/api/v1/orders/1/status?status=CONFIRMED" \
  -H "Authorization: Bearer <token>"
```

**Response**: Updated order object

### 7. Update Order (Admin/Staff Only)
**PUT** `/orders/{id}`

**Access**: ADMIN, STAFF

**Description**: Updates an existing order (items, quantities, etc.).

**Request Body**: Same as order creation

**Features**:
- ✅ Recalculates total amount
- ✅ Validates stock availability
- ✅ Updates inventory accordingly
- ✅ Transaction safety

### 8. Delete Order (Admin Only)
**DELETE** `/orders/{id}`

**Access**: ADMIN

**Description**: Deletes an order and restores stock if not already cancelled.

**Features**:
- ✅ Restores product stock if order is not cancelled
- ✅ Updates inventory accordingly
- ✅ Permanent deletion

## Stock Management Integration

### Automatic Stock Updates
When an order is created or updated:

1. **Stock Validation**: System checks if sufficient stock is available
2. **Stock Decrease**: Product stock is automatically decreased
3. **Inventory Update**: Inventory records are updated
4. **Transaction Safety**: All operations are wrapped in transactions

### Stock Restoration
When an order is deleted (if not cancelled):

1. **Stock Restoration**: Product stock is restored
2. **Inventory Update**: Inventory records are updated
3. **Data Consistency**: Ensures no stock loss

## Error Handling

### Common Error Scenarios

#### Insufficient Stock
```json
{
  "error": "Insufficient stock for product: iPhone 15. Available: 5, Requested: 10",
  "timestamp": "2024-01-01T10:30:00",
  "path": "/api/v1/orders"
}
```

#### Invalid Order Status
```json
{
  "error": "Invalid order status: INVALID_STATUS",
  "timestamp": "2024-01-01T10:30:00",
  "path": "/api/v1/orders/1/status"
}
```

#### Access Denied
```json
{
  "error": "Access denied",
  "timestamp": "2024-01-01T10:30:00",
  "path": "/api/v1/orders/1"
}
```

#### Empty Order
```json
{
  "error": "Order must contain at least one item",
  "timestamp": "2024-01-01T10:30:00",
  "path": "/api/v1/orders"
}
```

## Example Usage Scenarios

### Scenario 1: Customer Places Order
```bash
# 1. Login as customer
curl -X POST http://localhost:8080/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"customer1","password":"password123"}'

# 2. Create order
curl -X POST http://localhost:8080/api/v1/orders \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{
    "orderItems": [
      {
        "productId": 1,
        "quantity": 2,
        "price": 99.99
      }
    ]
  }'
```

### Scenario 2: Staff Confirms Order
```bash
# 1. Login as staff
curl -X POST http://localhost:8080/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"staff","password":"staff123"}'

# 2. Update order status
curl -X PUT "http://localhost:8080/api/v1/orders/1/status?status=CONFIRMED" \
  -H "Authorization: Bearer <token>"
```

### Scenario 3: Admin Views All Orders
```bash
# 1. Login as admin
curl -X POST http://localhost:8080/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin123"}'

# 2. Get all orders
curl -X GET http://localhost:8080/api/v1/orders \
  -H "Authorization: Bearer <token>"
```

### Scenario 4: Get Pending Orders
```bash
curl -X GET http://localhost:8080/api/v1/orders/status/PENDING \
  -H "Authorization: Bearer <token>"
```

## Validation Rules

### Order Creation
- ✅ Must contain at least one order item
- ✅ All products must exist
- ✅ Sufficient stock must be available
- ✅ Quantities must be greater than 0
- ✅ Prices must be positive

### Order Status Updates
- ✅ Status must be one of: PENDING, CONFIRMED, SHIPPED, DELIVERED, CANCELLED
- ✅ Only ADMIN/STAFF can update status
- ✅ Invalid status returns error

### Access Control
- ✅ Users can only view their own orders
- ✅ ADMIN/STAFF can view all orders
- ✅ Only ADMIN can delete orders
- ✅ Only ADMIN/STAFF can update orders

## Performance Considerations

### Database Optimization
- ✅ Indexes on user_id and status for fast queries
- ✅ Transaction management for data consistency
- ✅ Efficient stock validation

### Security
- ✅ JWT authentication required
- ✅ Role-based access control
- ✅ Input validation and sanitization
- ✅ SQL injection prevention

## Monitoring and Logging

### Order Tracking
- ✅ Order creation timestamps
- ✅ Status change history
- ✅ Stock impact tracking
- ✅ User activity logging

### Error Monitoring
- ✅ Failed order attempts
- ✅ Stock validation failures
- ✅ Access control violations
- ✅ System error logging
