# Power BI Dashboard

## Overview

The Power BI dashboard provides an interactive view of the historical patterns identified in the Global Terrorism Analysis.

The dashboard allows the analysis to be explored across time, geography, attack characteristics, targets, weapons, terrorist organizations, and recorded casualties.

---

## Dashboard Objectives

The dashboard was developed to provide an interactive view of:

- Incident trends over time
- Regional and country-level incident distribution
- Attack type patterns
- Target type distribution
- Weapon type distribution
- Terrorist organizations associated with recorded incidents
- Recorded fatalities and injuries
- Geographic distribution of incidents

---

## Dashboard Pages

### Page 1 — Global Terrorism Analysis Overview

The overview page provides a high-level summary of the dataset and highlights major trends in recorded terrorist incidents.

Key elements include:

- Total incident metrics
- Recorded casualty metrics
- Incident trends over time
- Regional distribution
- Attack type analysis
- Geographic distribution
- Interactive filters

![Global Terrorism Analysis Overview](Global_Terrorism%20Analysis%20Overview%28Page1%29.png)

---

### Page 2 — Global Terrorism Detailed Analysis

The detailed analysis page provides additional breakdowns of incidents by attack characteristics, targets, weapons, organizations, and casualties.

Key elements include:

- Attack type analysis
- Target type analysis
- Weapon type analysis
- Terrorist organization analysis
- Casualty analysis
- Geographic and categorical comparisons
- Interactive filtering

![Global Terrorism Detailed Analysis](Global_Terrorism%20Detailed%20Analysis%28Page2%29.png)

---

## Interactivity

The dashboard uses interactive filters to allow users to explore the data across different:

- Years
- Regions
- Countries
- Attack types
- Target categories
- Other available analytical dimensions

Selections made within the dashboard update the relevant visualizations and metrics.

---

## Data Source

The dashboard is based on the **Global Terrorism Database (GTD)** covering recorded incidents from **1970 to 2017**.

The dashboard uses the processed analytical dataset created during the Python data preparation stage.

The processed dataset contains **181,691 records and 23 selected analytical fields**.

---

## Data Preparation

The source GTD dataset was initially profiled using Python and Pandas.

The final analytical dataset was created by selecting fields relevant to the analysis and dashboard requirements, including:

- Incident date
- Country and region
- Location
- Attack type
- Target type
- Weapon type
- Terrorist organization
- Attack success
- Suicide indicator
- Fatalities
- Injuries
- Geographic coordinates

The processed dataset was then loaded into SQL Server and used for the analytical workflow.

---

## Power BI File

The complete Power BI dashboard is available in this folder:

```text
Global Terrorism Analysis.pbix
