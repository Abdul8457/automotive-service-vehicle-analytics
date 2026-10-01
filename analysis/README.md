# Service Analytics

This module analyzes vehicle service and maintenance data from
the SQLite database.

## Current Analysis

The service analysis module currently calculates:

- Total number of service records
- Total service cost
- Average service cost

## Data Sources

The analysis uses data from:

- `vehicles`
- `service_records`
- `service_types`

The data is combined using SQL joins and loaded into a
pandas DataFrame for further analysis.

## Python Technologies

- Python
- pandas
- SQLite

## Planned Analysis

Future analysis will include:

- Service cost by vehicle
- Service frequency by service type
- Maintenance cost trends
- Vehicle service history comparisons
- Data visualizations using Matplotlib
