# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Build (skip tests)
mvn clean package -DskipTests

# Run locally
mvn spring-boot:run

# Run tests
mvn test

# Run a single test class
mvn test -Dtest=ClassName

# Docker
docker build -t shop-management:latest .
docker run -p 8080:8080 shop-management:latest
```

The API is served at `http://localhost:8080/api/v1`.

## Architecture

Spring Boot 3.2 / Java 21 REST API for e-commerce shop management.

**Tech stack**: Spring Security 6 + JWT, Spring Data JPA + Hibernate, PostgreSQL, Liquibase migrations.

**Layered structure** (all under `src/main/java/com/shopmanagement/`):

- `controller/` — HTTP endpoints (Auth, Product, Order, Category, Inventory, Review, User)
- `service/` — Business logic
- `repository/` — Spring Data JPA repositories
- `entity/` — JPA entities (User, Product, Order, OrderItem, Category, Inventory, Review)
- `dto/` — Request/response objects
- `security/` — `JwtService` and `JwtAuthenticationFilter`
- `config/` — `SecurityConfig`, `ApplicationConfig` (beans), `DataInitializer` (seed data)

**Database migrations** live in `src/main/resources/db/changelog/`. All schema changes must be made through new Liquibase changesets (never alter existing ones).

## Security Model

Three roles: `ADMIN`, `STAFF`, `CUSTOMER`.

| Endpoint pattern | Access |
|---|---|
| `POST /auth/**` | Public |
| `GET /products/**`, `GET /categories/**`, `GET /reviews/**` | Public |
| `DELETE /products/**`, user management | ADMIN only |
| `POST/PUT /products/**`, inventory management | ADMIN or STAFF |
| Order creation, own order viewing, reviews | CUSTOMER |

JWT tokens expire after 24 hours. The filter chain is stateless (no sessions). CSRF is disabled. CORS allows all origins.

## Database

- **Connection**: `localhost:5432/shop_management`, user `postgres`, password `postgres`
- **Seed users** (all password `password123`): `admin`, `staff1`, `customer1`, `john_doe`
- `Product` stores specifications as a `Map<String, String>` (JSONB column) and images/tags as element collections.
- `Order` status enum: `PENDING`, `COMPLETED`, `CANCELLED`, `SHIPPED`.
- `Product` condition enum: `NEW`, `USED`.

## Key Conventions

- DTOs in `dto/` are used for both request bodies and response payloads — check existing DTOs before creating new ones.
- `DataInitializer` runs on startup and inserts seed data only if the tables are empty.
- API documentation is maintained in `API_DOCUMENTATION.md` and `ORDER_API_DOCUMENTATION.md` — update these when adding or changing endpoints.
