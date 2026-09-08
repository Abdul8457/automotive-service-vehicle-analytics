-- Automotive Service & Vehicle Analytics
-- Sample data for development and analysis
-- SQLite-compatible

PRAGMA foreign_keys = ON;

-- --------------------------------------------------
-- Customers
-- --------------------------------------------------

INSERT INTO customers
    (customer_id, customer_name, city)
VALUES
    (1, 'Thomas Weber', 'Karlsruhe'),
    (2, 'Anna Schmidt', 'Stuttgart'),
    (3, 'Michael Fischer', 'Mannheim'),
    (4, 'Laura Becker', 'Heidelberg'),
    (5, 'Daniel Hoffmann', 'Freiburg');

-- --------------------------------------------------
-- Vehicles
-- --------------------------------------------------

INSERT INTO vehicles
    (
        vehicle_id,
        customer_id,
        registration_number,
        manufacturer,
        model,
        model_year,
        fuel_type
    )
VALUES
    (1, 1, 'KA-AB-101', 'Volkswagen', 'Golf', 2019, 'Petrol'),
    (2, 2, 'S-CD-202', 'BMW', '320i', 2020, 'Petrol'),
    (3, 3, 'MA-EF-303', 'Mercedes-Benz', 'C220d', 2018, 'Diesel'),
    (4, 4, 'HD-GH-404', 'Audi', 'A4', 2021, 'Diesel'),
    (5, 5, 'FR-IJ-505', 'Toyota', 'Corolla', 2020, 'Hybrid'),
    (6, 1, 'KA-KL-606', 'Ford', 'Focus', 2017, 'Petrol'),
    (7, 3, 'MA-MN-707', 'Volkswagen', 'Passat', 2019, 'Diesel'),
    (8, 5, 'FR-OP-808', 'Skoda', 'Octavia', 2022, 'Petrol');

-- --------------------------------------------------
-- Service types
-- --------------------------------------------------

INSERT INTO service_types
    (service_type_id, service_name, description)
VALUES
    (1, 'Oil Change', 'Engine oil and oil filter replacement'),
    (2, 'Brake Service', 'Inspection and maintenance of braking components'),
    (3, 'Inspection', 'General vehicle inspection and maintenance check'),
    (4, 'Tire Service', 'Tire inspection, replacement, or balancing'),
    (5, 'Battery Service', 'Battery inspection and replacement'),
    (6, 'Major Service', 'Comprehensive scheduled vehicle maintenance');

-- --------------------------------------------------
-- Service records
-- --------------------------------------------------

INSERT INTO service_records
    (
        service_id,
        vehicle_id,
        service_type_id,
        service_date,
        mileage_km,
        service_cost,
        service_notes
    )
VALUES
    (1, 1, 1, '2025-01-15', 45000, 129.90,
     'Engine oil and oil filter replaced'),

    (2, 1, 3, '2025-07-20', 52000, 189.50,
     'General vehicle inspection'),

    (3, 1, 2, '2026-02-10', 61000, 349.00,
     'Front brake pads replaced'),

    (4, 2, 6, '2025-03-12', 38000, 420.00,
     'Scheduled major service'),

    (5, 2, 4, '2025-10-05', 46000, 280.00,
     'Four tires replaced'),

    (6, 2, 1, '2026-04-18', 55000, 145.00,
     'Engine oil and filter service'),

    (7, 3, 3, '2025-02-08', 72000, 210.00,
     'General inspection'),

    (8, 3, 2, '2025-08-19', 79000, 510.00,
     'Brake pads and discs replaced'),

    (9, 3, 6, '2026-03-25', 87000, 680.00,
     'Major scheduled maintenance'),

    (10, 4, 1, '2025-05-16', 29000, 155.00,
     'Engine oil and filter service'),

    (11, 4, 3, '2026-01-22', 36000, 195.00,
     'General inspection'),

    (12, 5, 4, '2025-04-14', 41000, 260.00,
     'Tire replacement and balancing'),

    (13, 5, 1, '2025-11-10', 48000, 135.00,
     'Engine oil service'),

    (14, 5, 5, '2026-05-06', 56000, 220.00,
     '12 V battery replaced'),

    (15, 6, 2, '2025-06-21', 88000, 390.00,
     'Rear brake pads replaced'),

    (16, 6, 3, '2026-02-15', 95000, 175.00,
     'General inspection'),

    (17, 7, 1, '2025-03-30', 67000, 150.00,
     'Engine oil and filter service'),

    (18, 7, 6, '2026-04-02', 76000, 590.00,
     'Scheduled major maintenance'),

    (19, 8, 3, '2025-09-11', 22000, 180.00,
     'General inspection'),

    (20, 8, 1, '2026-03-14', 30000, 140.00,
     'Engine oil and filter service');

-- --------------------------------------------------
-- Parts
-- --------------------------------------------------

INSERT INTO parts
    (part_id, part_name, manufacturer)
VALUES
    (1, 'Engine Oil Filter', 'MANN-FILTER'),
    (2, 'Engine Oil 5W-30', 'Castrol'),
    (3, 'Front Brake Pads', 'ATE'),
    (4, 'Brake Disc', 'Brembo'),
    (5, 'Passenger Car Tire', 'Continental'),
    (6, '12 V Vehicle Battery', 'VARTA'),
    (7, 'Air Filter', 'Bosch'),
    (8, 'Cabin Air Filter', 'MAHLE');

-- --------------------------------------------------
-- Parts used in service records
-- --------------------------------------------------

INSERT INTO service_parts
    (service_id, part_id, quantity, unit_cost)
VALUES
    (1, 1, 1, 18.50),
    (1, 2, 5, 8.00),

    (3, 3, 1, 95.00),
    (3, 4, 2, 85.00),

    (5, 5, 4, 70.00),

    (6, 1, 1, 18.50),
    (6, 2, 5, 8.50),

    (8, 3, 1, 110.00),
    (8, 4, 2, 95.00),

    (10, 1, 1, 20.00),
    (10, 2, 5, 9.00),

    (12, 5, 4, 65.00),

    (13, 1, 1, 18.50),
    (13, 2, 5, 8.00),

    (14, 6, 1, 150.00),

    (15, 3, 2, 85.00),

    (17, 1, 1, 19.00),
    (17, 2, 5, 8.50);
