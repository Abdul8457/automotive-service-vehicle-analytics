-- Automotive Service & Vehicle Analytics
-- Database schema
-- SQLite-compatible

PRAGMA foreign_keys = ON;

-- --------------------------------------------------
-- Customers
-- --------------------------------------------------

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    city TEXT
);

-- --------------------------------------------------
-- Vehicles
-- --------------------------------------------------

CREATE TABLE vehicles (
    vehicle_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    registration_number TEXT NOT NULL UNIQUE,
    manufacturer TEXT NOT NULL,
    model TEXT NOT NULL,
    model_year INTEGER,
    fuel_type TEXT,
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- --------------------------------------------------
-- Service types
-- --------------------------------------------------

CREATE TABLE service_types (
    service_type_id INTEGER PRIMARY KEY,
    service_name TEXT NOT NULL UNIQUE,
    description TEXT
);

-- --------------------------------------------------
-- Service records
-- --------------------------------------------------

CREATE TABLE service_records (
    service_id INTEGER PRIMARY KEY,
    vehicle_id INTEGER NOT NULL,
    service_type_id INTEGER NOT NULL,
    service_date TEXT NOT NULL,
    mileage_km INTEGER,
    service_cost REAL,
    service_notes TEXT,
    FOREIGN KEY (vehicle_id)
        REFERENCES vehicles(vehicle_id),
    FOREIGN KEY (service_type_id)
        REFERENCES service_types(service_type_id)
);

-- --------------------------------------------------
-- Parts
-- --------------------------------------------------

CREATE TABLE parts (
    part_id INTEGER PRIMARY KEY,
    part_name TEXT NOT NULL,
    manufacturer TEXT
);

-- --------------------------------------------------
-- Parts used in service records
-- --------------------------------------------------

CREATE TABLE service_parts (
    service_id INTEGER NOT NULL,
    part_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_cost REAL,
    PRIMARY KEY (service_id, part_id),
    FOREIGN KEY (service_id)
        REFERENCES service_records(service_id),
    FOREIGN KEY (part_id)
        REFERENCES parts(part_id)
);
