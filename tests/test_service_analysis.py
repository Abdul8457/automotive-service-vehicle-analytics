"""Tests for automotive service analysis functions."""

import pandas as pd

from analysis.service_analysis import (
    calculate_cost_by_vehicle,
    calculate_service_summary,
)


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


def test_calculate_cost_by_vehicle():
    """Verify total service cost is calculated for each vehicle."""

    service_data = pd.DataFrame(
        {
            "registration_number": [
                "KA-AB-101",
                "KA-AB-101",
                "S-CD-202",
            ],
            "service_cost": [
                100.00,
                300.00,
                200.00,
            ],
        }
    )

    result = calculate_cost_by_vehicle(service_data)

    assert result.iloc[0]["registration_number"] == "KA-AB-101"
    assert result.iloc[0]["total_service_cost"] == 400.00

    assert result.iloc[1]["registration_number"] == "S-CD-202"
    assert result.iloc[1]["total_service_cost"] == 200.00
