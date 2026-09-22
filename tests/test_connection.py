"""Tests for the SQLite database connection utility."""

import sqlite3

from src.database.connection import get_connection


def test_get_connection_returns_sqlite_connection():
    """Verify that the utility returns a valid SQLite connection."""

    connection = get_connection()

    try:
        assert isinstance(connection, sqlite3.Connection)
    finally:
        connection.close()


def test_connection_uses_row_factory():
    """Verify that database rows can be accessed by column name."""

    connection = get_connection()

    try:
        assert connection.row_factory == sqlite3.Row
    finally:
        connection.close()
