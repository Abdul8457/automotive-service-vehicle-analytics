"""Run SQL analytics queries against the vehicle service database."""

from pathlib import Path

from src.database.connection import get_connection

PROJECT_ROOT = Path(__file__).resolve().parents[2]
QUERIES_FILE = PROJECT_ROOT / "database" / "queries.sql"


def run_analytics() -> None:
    """Execute SQL queries separated by semicolons and print results."""

    sql_script = QUERIES_FILE.read_text(encoding="utf-8")

    # Split the script into individual SQL statements.
    queries = [
        query.strip()
        for query in sql_script.split(";")
        if query.strip()
    ]

    with get_connection() as connection:
        cursor = connection.cursor()

        for index, query in enumerate(queries, start=1):
            print(f"\n--- Analytics Query {index} ---")

            cursor.execute(query)

            if cursor.description:
                columns = [column[0] for column in cursor.description]
                print(" | ".join(columns))

                for row in cursor.fetchall():
                    print(" | ".join(str(value) for value in row))


if __name__ == "__main__":
    run_analytics()
