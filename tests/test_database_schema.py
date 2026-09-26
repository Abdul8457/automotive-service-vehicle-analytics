"""Tests for the vehicle service database schema."""

import sqlite3
from pathlib import Path


PROJECT_ROOT = Path(__file__).resolve().parents[1]
SCHEMA_FILE = PROJECT_ROOT / "database" / "schema.sql"

EXPECTED_TABLES = {
    "customers",
    "vehicles",
    "service_types",
    "service_records",
    "parts",
    "service_parts",
}


def test_schema_creates_required_tables():
    """Verify that the SQL schema creates all required tables."""

    connection = sqlite3.connect(":memory:")

    try:
        schema = SCHEMA_FILE.read_text(encoding="utf-8")
        connection.executescript(schema)

        cursor = connection.cursor()

        cursor.execute(
            """
            SELECT name
            FROM sqlite_master
            WHERE type = 'table'
            """
        )

        actual_tables = {row[0] for row in cursor.fetchall()}

        assert EXPECTED_TABLES.issubset(actual_tables)

    finally:
        connection.close()
