-- Automotive Service & Vehicle Analytics
-- Basic SQL analysis queries
-- SQLite-compatible


-- 1. Display all vehicles with their owners
SELECT
    v.vehicle_id,
    c.customer_name,
    v.registration_number,
    v.manufacturer,
    v.model,
    v.model_year,
    v.fuel_type
FROM vehicles AS v
JOIN customers AS c
    ON v.customer_id = c.customer_id
ORDER BY v.manufacturer, v.model;


-- 2. Display complete service history
SELECT
    v.registration_number,
    v.manufacturer,
    v.model,
    sr.service_date,
    st.service_name,
    sr.mileage_km,
    sr.service_cost
FROM service_records AS sr
JOIN vehicles AS v
    ON sr.vehicle_id = v.vehicle_id
JOIN service_types AS st
    ON sr.service_type_id = st.service_type_id
ORDER BY sr.service_date DESC;


-- 3. Total service cost for each vehicle
SELECT
    v.registration_number,
    v.manufacturer,
    v.model,
    ROUND(SUM(sr.service_cost), 2) AS total_service_cost
FROM vehicles AS v
JOIN service_records AS sr
    ON v.vehicle_id = sr.vehicle_id
GROUP BY
    v.vehicle_id,
    v.registration_number,
    v.manufacturer,
    v.model
ORDER BY total_service_cost DESC;


-- 4. Average service cost by service type
SELECT
    st.service_name,
    COUNT(sr.service_id) AS number_of_services,
    ROUND(AVG(sr.service_cost), 2) AS average_service_cost
FROM service_types AS st
JOIN service_records AS sr
    ON st.service_type_id = sr.service_type_id
GROUP BY
    st.service_type_id,
    st.service_name
ORDER BY average_service_cost DESC;


-- 5. Number of services performed by manufacturer
SELECT
    v.manufacturer,
    COUNT(sr.service_id) AS number_of_services
FROM vehicles AS v
JOIN service_records AS sr
    ON v.vehicle_id = sr.vehicle_id
GROUP BY v.manufacturer
ORDER BY number_of_services DESC;


-- 6. Highest recorded vehicle mileage
SELECT
    v.registration_number,
    v.manufacturer,
    v.model,
    MAX(sr.mileage_km) AS highest_recorded_mileage_km
FROM vehicles AS v
JOIN service_records AS sr
    ON v.vehicle_id = sr.vehicle_id
GROUP BY
    v.vehicle_id,
    v.registration_number,
    v.manufacturer,
    v.model
ORDER BY highest_recorded_mileage_km DESC;
