"""Create a visualization of service cost by service type."""

from pathlib import Path

import matplotlib.pyplot as plt

from analysis.service_analysis import (
    calculate_cost_by_service_type,
    load_service_history,
)


PROJECT_ROOT = Path(__file__).resolve().parents[1]
OUTPUT_DIR = PROJECT_ROOT / "outputs"
CHART_PATH = OUTPUT_DIR / "service_type_costs.png"


def create_service_type_cost_chart() -> Path:
    """Create and save a bar chart of service cost by service type."""

    service_data = load_service_history()
    cost_by_service_type = calculate_cost_by_service_type(service_data)

    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    plt.figure(figsize=(10, 6))

    plt.bar(
        cost_by_service_type["service_name"],
        cost_by_service_type["total_service_cost"],
    )

    plt.title("Total Service Cost by Service Type")
    plt.xlabel("Service Type")
    plt.ylabel("Total Service Cost (€)")
    plt.xticks(rotation=45, ha="right")
    plt.tight_layout()

    plt.savefig(CHART_PATH, dpi=150)
    plt.close()

    return CHART_PATH


if __name__ == "__main__":
    chart_path = create_service_type_cost_chart()
    print(f"Chart saved to: {chart_path}")
