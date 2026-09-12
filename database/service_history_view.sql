-- Automotive Service & Vehicle Analytics
-- Reusable service history view
-- SQLite-compatible

DROP VIEW IF EXISTS service_history;

CREATE VIEW service_history AS
SELECT
    sr.service_id,
    v.registration_number,
    v.manufacturer,
    v.model,
    v.model_year,
    c.customer_name,
    st.service_name,
    sr.service_date,
    sr.mileage_km,
    sr.service_cost,
    sr.service_notes
FROM service_records AS sr
JOIN vehicles AS v
    ON sr.vehicle_id = v.vehicle_id
JOIN customers AS c
    ON v.customer_id = c.customer_id
JOIN service_types AS st
    ON sr.service_type_id = st.service_type_id;
