# Global Terrorism Analysis

## Project Overview

This project analyzes terrorist incidents recorded between 1970 and 2017 using the Global Terrorism Database (GTD).

The main goal of the analysis was to understand how terrorist incidents changed over time, how the trends differed across regions, which countries and attack types had the highest number of incidents, and how incidents were related to casualties.

I used SQL for data analysis, Python/Jupyter Notebook for exploratory analysis, and Power BI to create an interactive dashboard.

---

## Tools & Technologies

- SQL
- Python
- Jupyter Notebook
- Pandas
- Matplotlib
- Power BI
- DAX

---

## Key Questions

The analysis focuses on the following questions:

1. How did the number of terrorist incidents change over time?
2. How did terrorism trends differ across regions?
3. Is there a relationship between the number of incidents and casualties?
4. Which incidents resulted in the highest number of casualties?
5. What were the most common attack types?
6. Which countries recorded the highest number of incidents?
7. Which terrorist groups were associated with the highest number of recorded incidents?
8. Which years had the highest number of incidents?
9. Which regions and attack types accounted for the highest casualties?
10. Where were terrorist incidents geographically concentrated?

---

## Dashboard

The Power BI dashboard consists of two pages.

### Page 1 – Terrorism Overview

This page provides a high-level view of global terrorism incidents, including:

- Total incidents
- Total killed
- Total casualties
- Total wounded
- Countries affected
- Average fatalities per incident
- Geographic distribution of incidents
- Top 10 countries by incidents
- Incidents over time by region
- Distribution of incidents by attack type

### Page 2 – Terrorism Impact & Detailed Analysis

This page focuses on the impact and deeper analysis of terrorist incidents, including:

- Incidents with the highest casualties
- Top years by incident count
- Casualties by region
- Casualties by attack type
- Incidents vs. casualties over time

---

## Key Findings

- The number of terrorist incidents fluctuated considerably between 1970 and 2017, with a substantial increase over the long term.
- Global incidents reached their highest level in 2014 before declining through 2017.
- The regional distribution of incidents changed significantly over time.
- Western Europe and North America accounted for a larger share of incidents during the earlier years, while South Asia and the Middle East & North Africa became more prominent in later years.
- Bombing/Explosion and Armed Assault were among the most common attack types.
- A relatively small number of incidents contributed disproportionately to total casualties, highlighting the impact of high-casualty events.
- Several countries accounted for a significant proportion of the recorded incidents.
- Casualty levels varied considerably across regions and attack types, showing that the number of incidents alone does not fully represent the impact of terrorism.

---

## SQL Analysis

SQL was used to analyze the dataset and answer the main business questions.

The analysis includes:

- Incident trends by year
- Regional incident trends
- Incident and casualty analysis
- Highest-casualty incidents
- Attack type analysis
- Geographic incident data
- Countries with the highest number of incidents
- Terrorist groups with the highest number of recorded incidents
- Years with the highest number of incidents
- Regions with the highest incidents and casualties
- Attack types with the highest casualties

The complete SQL queries are available in:

`sql/terrorism_analysis.sql`

---

## Python / Jupyter Analysis

Python and Jupyter Notebook were used for exploratory data analysis and visualization.

The notebook includes:

- Data exploration
- Data cleaning
- Missing-value analysis
- Incident trends
- Regional analysis
- Casualty analysis
- Attack type analysis
- Exploratory visualizations

The notebook is available in:

`notebooks/global_terrorism_analysis.ipynb`

---

## Project Structure

```text
Global_Terrorism_Analysis/
│
├── data/
│   └── README.md
│
├── notebooks/
│   └── global_terrorism_analysis.ipynb
│
├── sql/
│   └── terrorism_analysis.sql
│
├── powerbi/
│   └── Global_Terrorism_Dashboard.pbix
│
├── images/
│   ├── dashboard_page_1.png
│   └── dashboard_page_2.png
│
├── README.md
└── .gitignore
