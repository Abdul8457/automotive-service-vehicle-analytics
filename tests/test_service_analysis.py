"""Tests for automotive service analysis functions."""

import pandas as pd

from analysis.service_analysis import calculate_service_summary


def test_calculate_service_summary():
    """Verify service summary calculations."""

    service_data = pd.DataFrame(
        {
            "service_cost": [100.00, 150.00, 250.00],
        }
    )

    summary = calculate_service_summary(service_data)

    assert summary["total_services"] == 3
    assert summary["total_service_cost"] == 500.00
    assert summary["average_service_cost"] == 166.67


def test_calculate_service_summary_with_empty_data():
    """Verify that empty data returns zero values."""

    service_data = pd.DataFrame(columns=["service_cost"])

    summary = calculate_service_summary(service_data)

    assert summary["total_services"] == 0
    assert summary["total_service_cost"] == 0.0
    assert summary["average_service_cost"] == 0.0
