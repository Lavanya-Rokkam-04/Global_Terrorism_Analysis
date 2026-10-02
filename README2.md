# Global Terrorism Analysis

## Business Context

This analysis examines historical terrorist incident data to identify changes in incident volume, geographic distribution, attack methods, target categories, weapon types, terrorist organizations, and casualties over time.

The analysis uses the **Global Terrorism Database (GTD)**, covering incidents recorded between **1970 and 2017**. The output includes a focused analytical dataset, SQL-based analysis, and an interactive Power BI dashboard for exploring the main patterns in the data.

> **Scope:** This is a descriptive analysis of recorded incidents in the GTD. It is not intended to explain the causes of terrorism or predict future terrorist activity.

---

## Objective

The objective of the analysis was to:

* Measure how recorded incident volume changed over time.
* Compare incident patterns across regions and countries.
* Identify the most frequently recorded attack and weapon types.
* Examine target categories and terrorist organizations associated with recorded incidents.
* Compare incident volume with recorded fatalities and injuries.
* Provide an interactive Power BI view of the main patterns in the data.

---

## Key Analytical Questions

1. How did the number of recorded incidents change between 1970 and 2017?
2. Which regions and countries recorded the highest number of incidents?
3. Which attack types and weapon types were most frequently recorded?
4. How did attack types vary across regions and years?
5. Which target categories were most frequently affected?
6. Which terrorist organizations were associated with the highest number of recorded incidents?
7. How did recorded casualties vary by year, region, and attack type?
8. Where were incidents geographically concentrated?

---

## Data

### Source

The analysis uses the **Global Terrorism Database (GTD)** maintained by the **National Consortium for the Study of Terrorism and Responses to Terrorism (START)** at the University of Maryland.

The source dataset used in the analysis contains:

* **181,691 records**
* **136 columns**
* **47 years of incident data**
* Coverage from **1970 through 2017**

The original dataset is not stored in this repository.

### Data Quality

Initial profiling was performed on the full dataset to review:

* Data types
* Missing values
* Unique values
* Categorical distributions
* Location fields
* Casualty fields

Several source fields contain substantial missing values. The analysis therefore focuses on fields relevant to the defined analytical questions rather than attempting to use every source column.

---

## Analytical Approach

```text
Global Terrorism Database
            |
            v
     Python / Pandas
            |
            |-- Data profiling
            |-- Missing-value assessment
            |-- Field selection
            |-- Analytical dataset creation
            |
            v
      181,691 x 23
      analytical dataset
            |
            v
        SQL Server
            |
            |-- Trend analysis
            |-- Regional analysis
            |-- Attack analysis
            |-- Casualty analysis
            |-- Geographic analysis
            |
            v
         Power BI
            |
            v
     Interactive dashboard
```

---

## Python Data Preparation

The source dataset was loaded and profiled using **Python and Pandas**.

The complete source dataset contains 136 columns. After reviewing the available fields and their suitability for the analysis, **23 fields** were selected for the analytical dataset used by the SQL analysis and Power BI dashboard.

The selected fields cover:

* Incident date
* Country and region
* Province/state and city
* Latitude and longitude
* Attack success and suicide indicators
* Attack type
* Target type
* Weapon type
* Terrorist organization
* Number killed
* Number wounded

The resulting analytical dataset contains:

**181,691 rows × 23 columns**

The processed dataset is exported as:

```text
GTD_dashboard.csv
```

The CSV is generated locally during the data preparation process and is not stored in the repository.

### Notebook

```text
notebooks/Global_Terrorism_analysis.ipynb
```

---

## SQL Server Analysis

The processed analytical dataset was loaded into a local SQL Server database.

```text
Database: GlobalTerrorism
Table: GTD_Dashboard
```

SQL was used to perform aggregations and comparisons across time, geography, attack characteristics, organizations, and casualties.

The analysis includes:

* Incident trends by year
* Regional incident trends
* Regional share of incidents
* Incident volume and recorded casualties by year
* Highest-casualty incidents
* Attack type trends by year and region
* Countries with the highest incident counts
* Terrorist organizations with the highest incident counts
* Years with the highest incident counts
* Regional incident and casualty comparisons
* Attack types ranked by recorded casualties
* Geographic incident data for mapping

SQL analysis:

```text
sql/terrorism_analysis.sql
```

---

## Power BI Dashboard

An interactive Power BI dashboard was developed to present the main findings and allow users to explore the data by different dimensions.

The dashboard includes:

* Overall incident and casualty metrics
* Incident trends over time
* Regional analysis
* Country-level analysis
* Attack type distribution
* Target type distribution
* Weapon type distribution
* Terrorist organization analysis
* Casualty analysis
* Geographic distribution
* Interactive filtering by year, region, and category

Power BI file:

```text
powerbi/Global Terrorism Analysis.pbix
```

The `.pbix` file requires **Power BI Desktop** to open.

### Dashboard Preview

#### Overview

![Global Terrorism Analysis Overview](powerbi/image/Global_Terrorism%20Analysis%20Overview%28Page1%29.png)

#### Detailed Analysis

![Global Terrorism Detailed Analysis](powerbi/image/Global_Terrorism%20Detailed%20Analysis%28Page2%29.png)

---

## Key Findings

### Incident Volume

The number of recorded incidents varied substantially across the 1970–2017 period.

The analysis identifies **2014 as the peak year for recorded incidents**, with a subsequent decline through 2017.

### Attack Types

The most frequently recorded attack types were:

| Attack Type                    | Recorded Incidents |
| ------------------------------ | -----------------: |
| Bombing/Explosion              |             88,255 |
| Armed Assault                  |             42,669 |
| Assassination                  |             19,312 |
| Hostage Taking (Kidnapping)    |             11,158 |
| Facility/Infrastructure Attack |             10,356 |

**Bombing/Explosion** was the most frequently recorded attack type in the dataset.

### Weapon Types

The most frequently recorded weapon types were:

| Weapon Type | Recorded Incidents |
| ----------- | -----------------: |
| Explosives  |             92,426 |
| Firearms    |             58,524 |
| Unknown     |             15,157 |
| Incendiary  |             11,135 |
| Melee       |              3,655 |

**Explosives** were the most frequently recorded weapon type.

### Recorded Attack Success

The `success` field contains:

* **161,632** records classified as successful
* **20,059** records classified as unsuccessful

This means approximately **88.96%** of recorded incidents were classified as successful in the dataset.

This metric describes the GTD `success` classification and should not be interpreted as a broader assessment of whether an attack achieved its intended objective.

### Suicide Incidents

The dataset contains:

* **175,058** non-suicide incidents
* **6,633** suicide incidents

Suicide incidents represent approximately **3.65%** of all recorded incidents.

### Target Categories

The most frequently recorded target categories include:

* Private Citizens & Property
* Military
* Police
* Government (General)
* Business
* Transportation
* Utilities

**Private Citizens & Property** is the largest target category in the selected dataset.

### Regional Patterns

The analysis shows substantial changes in the regional distribution of incidents across the period.

Western Europe and North America account for a larger share during parts of the earlier period, while the **Middle East & North Africa** and **South Asia** become increasingly prominent in later years.

---

## Data Quality & Limitations

* The source dataset contains substantial missingness across many variables.
* The analysis uses a selected set of 23 fields rather than all 136 source columns.
* Latitude and longitude contain missing values, which affects geographic visualization.
* `nkill` and `nwound` contain missing values. Casualty aggregations in SQL account for NULL values.
* The dataset covers incidents recorded through 2017 and therefore does not represent more recent events.
* The analysis is descriptive and historical; it does not attempt to predict future incidents or establish causal relationships.
* Results represent patterns in the recorded GTD data and should be interpreted within the definitions and limitations of the source dataset.

---

## Repository Structure

```text
Global_Terrorism_Analysis/
│
├── data/
│   └── README.md
│
├── notebooks/
│   └── Global_Terrorism_analysis.ipynb
│
├── powerbi/
│   ├── Global Terrorism Analysis.pbix
│   ├── README.md
│   └── image/
│       ├── Global_Terrorism Analysis Overview(Page1).png
│       └── Global_Terrorism Detailed Analysis(Page2).png
│
├── sql/
│   └── terrorism_analysis.sql
│
├── .gitignore
├── README.md
└── README_professional.md
```

---

## Reproducibility

### 1. Obtain the Source Dataset

Download the **Global Terrorism Database (GTD)** separately. The original source file is not included in this repository.

### 2. Run the Python Notebook

Open:

```text
notebooks/Global_Terrorism_analysis.ipynb
```

Update the local file path to the downloaded GTD CSV and run the notebook.

The notebook creates the 23-column analytical dataset.

### 3. Load the Analytical Dataset into SQL Server

Create a SQL Server database named:

```text
GlobalTerrorism
```

Load the processed dataset into:

```text
GTD_Dashboard
```

The notebook contains the connection and table-loading code used during the analysis.

### 4. Run the SQL Analysis

Open:

```text
sql/terrorism_analysis.sql
```

and execute the queries in **SQL Server Management Studio**.

### 5. Open the Power BI Dashboard

Open:

```text
powerbi/Global Terrorism Analysis.pbix
```

using **Power BI Desktop**.

---

## Technology Stack

| Technology       | Role                                      |
| ---------------- | ----------------------------------------- |
| Python           | Data loading and preparation              |
| Pandas           | Data profiling and transformation         |
| Jupyter Notebook | Exploratory analysis                      |
| SQL Server       | Analytical data storage                   |
| SQL              | Aggregation and analytical queries        |
| Power BI         | Dashboard and visualization               |
| GitHub           | Version control and project documentation |

---

## Data Source

The analysis is based on the **Global Terrorism Database (GTD)** maintained by START at the University of Maryland.

The dataset covers recorded incidents from **1970 to 2017**.

---

## Author

**Lavanya Rokkamm**

**Analytics workflow:** Python → SQL Server → Power BI → GitHub

