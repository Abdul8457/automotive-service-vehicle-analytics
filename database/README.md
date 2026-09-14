# Database

This directory contains the SQL components of the Automotive Service & Vehicle Analytics project.

## Files

### `schema.sql`

Defines the relational database structure, including:

- Customers
- Vehicles
- Service types
- Service records
- Parts
- Service parts

Primary keys and foreign-key relationships are used to maintain relationships between the tables.

### `seed_data.sql`

Contains synthetic sample data used for development and SQL analysis.

The sample dataset includes vehicle information, service records, service types, parts, and service-part relationships.

### `queries.sql`

Contains SQL queries for analysing automotive service data.

The queries demonstrate:

- Table joins
- Aggregation
- `GROUP BY`
- `COUNT`
- `SUM`
- `AVG`
- `MAX`
- Common table expressions (CTEs)
- Window functions
- Year-based analysis

### `service_history_view.sql`

Defines a reusable `service_history` database view that combines customer, vehicle, service, and service-type information.

The view simplifies repeated service-history analysis by providing a single queryable data layer.

## Database Technology

The SQL scripts are written for **SQLite**.

## Data

All data included in the project is synthetic and is intended only for development, testing, and demonstration purposes.
