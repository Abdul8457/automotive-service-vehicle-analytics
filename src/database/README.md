# Python Database Utilities

This directory contains Python utilities for working with
the Automotive Service & Vehicle Analytics database.

## Files

| File | Description |
|---|---|
| `__init__.py` | Marks the directory as a Python package |
| `connection.py` | Creates connections to the SQLite database |
| `initialize_db.py` | Initializes the database using SQL scripts |
| `validate_db.py` | Checks required tables and sample data |
| `run_analytics.py` | Executes SQL analytics queries |

## Database Workflow

1. Initialize the SQLite database.
2. Validate the database structure and sample data.
3. Execute the analytics queries.
4. Review the results in the terminal.

## Database Location

The SQLite database is stored in the project's
`data/` directory as `vehicle_service.db`.

## Technologies

- Python
- SQLite
- SQL
