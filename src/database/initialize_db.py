"""Initialize the SQLite database from the project SQL scripts."""

from pathlib import Path

from src.database.connection import get_connection


PROJECT_ROOT = Path(__file__).resolve().parents[2]
SCHEMA_FILE = PROJECT_ROOT / "database" / "schema.sql"
SEED_FILE = PROJECT_ROOT / "database" / "seed_data.sql"


def execute_sql_file(connection, file_path: Path) -> None:
    """Execute all SQL statements contained in a file."""
    sql_script = file_path.read_text(encoding="utf-8")
    connection.executescript(sql_script)


def initialize_database() -> None:
    """Create the database schema and load the sample data."""
    with get_connection() as connection:
        execute_sql_file(connection, SCHEMA_FILE)
        execute_sql_file(connection, SEED_FILE)


if __name__ == "__main__":
    initialize_database()
    print("Database initialized successfully.")
