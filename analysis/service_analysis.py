"""Automotive service data analysis utilities."""

import pandas as pd

from src.database.connection import get_connection


SERVICE_HISTORY_QUERY = """
SELECT
    sr.service_id,
    v.registration_number,
    v.manufacturer,
    v.model,
    v.model_year,
    v.fuel_type,
    st.service_name,
    sr.service_date,
    sr.mileage_km,
    sr.service_cost
FROM service_records AS sr
JOIN vehicles AS v
    ON sr.vehicle_id = v.vehicle_id
JOIN service_types AS st
    ON sr.service_type_id = st.service_type_id
ORDER BY sr.service_date;
"""


def load_service_history() -> pd.DataFrame:
    """Load vehicle service history from the SQLite database."""

    with get_connection() as connection:
        return pd.read_sql_query(SERVICE_HISTORY_QUERY, connection)


def calculate_service_summary(service_data: pd.DataFrame) -> dict:
    """Calculate basic summary statistics from service history."""

    if service_data.empty:
        return {
            "total_services": 0,
            "total_service_cost": 0.0,
            "average_service_cost": 0.0,
        }

    return {
        "total_services": int(len(service_data)),
        "total_service_cost": round(
            float(service_data["service_cost"].sum()), 2
        ),
        "average_service_cost": round(
            float(service_data["service_cost"].mean()), 2
        ),
    }


def main() -> None:
    """Load service data and display a summary."""

    service_data = load_service_history()
    summary = calculate_service_summary(service_data)

    print("Automotive Service Summary")
    print("--------------------------")
    print(f"Total services: {summary['total_services']}")
    print(f"Total service cost: €{summary['total_service_cost']:.2f}")
    print(f"Average service cost: €{summary['average_service_cost']:.2f}")


if __name__ == "__main__":
    main()
