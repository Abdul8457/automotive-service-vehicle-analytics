"""Validate the structure and contents of the SQLite database."""

from src.database.connection import get_connection


EXPECTED_TABLES = {
    "customers",
    "vehicles",
    "service_types",
    "service_records",
    "parts",
    "service_parts",
}


def validate_database() -> bool:
    """Check required tables and confirm that sample data exists."""

    with get_connection() as connection:
        cursor = connection.cursor()

        cursor.execute(
            """
            SELECT name
            FROM sqlite_master
            WHERE type = 'table'
            """
        )

        existing_tables = {
            row["name"] for row in cursor.fetchall()
        }

        missing_tables = EXPECTED_TABLES - existing_tables

        if missing_tables:
            print(f"Missing tables: {sorted(missing_tables)}")
            return False

        cursor.execute("SELECT COUNT(*) FROM vehicles")
        vehicle_count = cursor.fetchone()[0]

        cursor.execute("SELECT COUNT(*) FROM service_records")
        service_count = cursor.fetchone()[0]

        if vehicle_count == 0 or service_count == 0:
            print("Database exists, but sample data is missing.")
            return False

        print("Database validation successful.")
        print(f"Vehicles: {vehicle_count}")
        print(f"Service records: {service_count}")

        return True


if __name__ == "__main__":
    validate_database()
