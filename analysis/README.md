# Service Analytics

This module analyzes vehicle service and maintenance data from the SQLite database using Python, pandas, and SQL.

## Current Analysis

The module currently calculates:

- Total number of service records
- Total service cost
- Average service cost
- Total service cost by vehicle
- Total service cost by service type

## Data Sources

The analysis uses data from:

- `vehicles`
- `service_records`
- `service_types`

The data is combined using SQL joins and loaded into a pandas DataFrame for analysis.

## Data Visualizations

The project generates two charts using Matplotlib:

- `outputs/vehicle_service_costs.png` — Total service cost by vehicle
- `outputs/service_type_costs.png` — Total service cost by service type

## Python Technologies

- Python
- pandas
- SQLite
- Matplotlib

## Running the Analysis

From the project root, run:

```bash
python -m analysis.service_analysis
```

To generate the charts:

```bash
python -m analysis.visualize_service_costs
python -m analysis.visualize_service_type_costs
```
