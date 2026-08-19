# 🌍 Global Terrorism Analysis

## 📊 Project Overview

This project analyzes the **Global Terrorism Database (GTD)** to understand patterns and trends in terrorist incidents across different years, regions, countries, attack types, target types, weapons, casualties, and terrorist organizations.

I worked on this project as an end-to-end data analytics project using **Python, SQL Server, and Power BI**. I first explored and prepared the dataset using Python and Pandas, then loaded the selected data into SQL Server for analysis, and finally built an interactive Power BI dashboard to present the findings.

The original dataset contains **181,691 incidents and 136 columns**, covering terrorist incidents recorded between **1970 and 2017**.

---

## 🎯 Project Objectives

The main questions I wanted to answer through this analysis were:

- How have terrorist incidents changed over the years?
- Which regions and countries recorded the highest number of incidents?
- Is there a relationship between incidents and casualties?
- Which attack methods were most commonly used?
- How did attack methods vary across regions and over time?
- Which types of targets were most frequently affected?
- Which weapon types were most commonly recorded?
- Which terrorist organizations were associated with the highest number of incidents?
- Where were the incidents geographically concentrated?
- Which years, regions, and attack types had the highest casualty levels?

---

## 🗂️ Dataset

The project uses the **Global Terrorism Database (GTD)**.

The original dataset contains:

- **181,691 records**
- **136 columns**
- **47 years of data**
- Incident information from **1970 to 2017**
- Information about locations, attack methods, targets, weapons, casualties, and terrorist organizations

The original dataset is not included in this repository because of its large file size.

Instead, I loaded the dataset locally using Python and selected the fields required for the analysis and Power BI dashboard.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **Python** | Data loading, exploration, and preparation |
| **Pandas** | Data manipulation and analysis |
| **Jupyter Notebook** | Exploratory data analysis |
| **SQL Server** | Data storage and analytical querying |
| **SQL** | Trend and category-level analysis |
| **Power BI** | Interactive dashboard and visualization |
| **GitHub** | Project documentation and version control |

---

## 🔄 Project Workflow

```text
Global Terrorism Database
            │
            ▼
      Python / Pandas
            │
            ├── Data Loading
            ├── Data Exploration
            ├── Missing Value Analysis
            └── Column Selection
            │
            ▼
     Processed Dataset
     181,691 × 23 columns
            │
            ▼
        SQL Server
            │
            ├── GTD_Dashboard Table
            └── SQL Analysis Queries
            │
            ▼
         Power BI
            │
            ▼
    Interactive Dashboard
```

---

# 🐍 Python Data Analysis

The Jupyter Notebook contains the initial data exploration and preparation process.

## Dataset Inspection

The original dataset was loaded using Pandas:

```python
import pandas as pd

file_path = r"C:\Users\lavan\Downloads\globalterrorismdb_0718dist.csv"

df = pd.read_csv(file_path, low_memory=False)
```

The dataset contains:

- **181,691 rows**
- **136 columns**

The notebook was used to examine:

- Dataset dimensions
- Column names
- Data types
- Missing values
- Unique values
- Attack types
- Target types
- Weapon types
- Successful attacks
- Suicide attacks
- Casualties

---

## 🔎 Missing Value Analysis

The dataset contains a large number of variables with missing values.

Some columns have extremely high percentages of missing data.

Examples include:

| Column | Missing Percentage |
|---|---:|
| `gsubname3` | 99.99% |
| `weaptype4` | 99.96% |
| `claimmode3` | 99.93% |
| `gname3` | 99.82% |
| `ransomnote` | 99.72% |

Because many of these fields were not required for the dashboard, I focused the analysis on a smaller set of relevant variables.

---

## 📋 Dashboard Dataset Preparation

I selected **23 columns** that were relevant to the dashboard and analytical questions.

The selected fields include:

```text
eventid
iyear
imonth
iday
country
country_txt
region
region_txt
provstate
city
latitude
longitude
success
suicide
attacktype1
attacktype1_txt
targtype1
targtype1_txt
weaptype1
weaptype1_txt
gname
nkill
nwound
```

The resulting dataset contains:

**181,691 rows × 23 columns**

The processed dataset was exported as:

```text
GTD_dashboard.csv
```

The notebook also checks the structure, data types, and missing values of the processed dataset before loading it into SQL Server.

---

# 🗄️ SQL Server Analysis

After preparing the dataset in Python, I loaded the processed data into a local SQL Server database.

### Database

```text
GlobalTerrorism
```

### Main Table

```text
GTD_Dashboard
```

SQL was then used to perform additional analysis and answer the main project questions.

The SQL queries cover:

- Terrorist incidents by year
- Regional incident trends
- Incident and casualty analysis
- Highest-casualty incidents
- Attack type analysis
- Attack types by region and year
- Countries with the highest number of incidents
- Terrorist organizations with the highest number of incidents
- Years with the highest number of incidents
- Regions with the highest number of incidents and casualties
- Attack types with the highest casualties
- Geographic incident information for mapping

The complete SQL analysis is available here:

```text
sql/terrorism_analysis.sql
```

---

# 📊 Power BI Dashboard

I built an interactive Power BI dashboard to explore the major patterns and trends identified during the analysis.

The dashboard covers:

- Overall terrorist incidents and casualties
- Incident trends over time
- Regional and country-level analysis
- Attack types
- Target types
- Weapon types
- Terrorist organizations
- Geographic distribution of incidents
- Key incident and casualty metrics

The complete Power BI dashboard is available as:

```text
powerbi/Global Terrorism Analysis.pbix
```

> **Note:** The `.pbix` file requires Power BI Desktop to open and interact with the dashboard.

## Dashboard Preview

### Page 1 — Global Terrorism Analysis Overview

![Global Terrorism Analysis Overview](powerbi/image/Global_Terrorism%20Detailed%20Analysis%28Page2%29.png)

---

### Page 2 — Global Terrorism Detailed Analysis

![Global Terrorism Detailed Analysis](powerbi/image/Global_Terrorism%20Analysis%20Overview%28Page1%29.png)

---

# 📈 Key Findings

The analysis revealed several interesting patterns in the dataset.

## 1. Terrorist Incidents Over Time

The number of recorded terrorist incidents changed considerably between 1970 and 2017.

Global incidents reached their highest level in **2014**, with **16,903 recorded incidents**, followed by a decline through 2017.

The regional pattern also changed significantly over time.

During the earlier years, regions such as **Western Europe and North America** accounted for a larger share of incidents.

From the 2000s onward, **Middle East & North Africa and South Asia** became much more prominent.

For example:

- In **2014**, Middle East & North Africa accounted for approximately **41.05%** of global incidents.
- In **2016**, the region accounted for approximately **45.01%**.
- In **2017**, Middle East & North Africa accounted for approximately **34.68%**, followed by South Asia at **31.47%** and Sub-Saharan Africa at **18.07%**.

---

## 2. Most Common Attack Types

The most frequently recorded attack types were:

| Attack Type | Incidents |
|---|---:|
| Bombing/Explosion | 88,255 |
| Armed Assault | 42,669 |
| Assassination | 19,312 |
| Hostage Taking (Kidnapping) | 11,158 |
| Facility/Infrastructure Attack | 10,356 |

**Bombing/Explosion** was the most common attack type in the dataset.

---

## 3. Most Common Weapon Types

The most frequently recorded weapon types were:

| Weapon Type | Incidents |
|---|---:|
| Explosives | 92,426 |
| Firearms | 58,524 |
| Unknown | 15,157 |
| Incendiary | 11,135 |
| Melee | 3,655 |

**Explosives** were the most frequently recorded weapon type.

---

## 4. Successful Attacks

Out of **181,691 incidents**:

- **161,632** were recorded as successful.
- **20,059** were recorded as unsuccessful.

This means the large majority of incidents in the dataset were classified as successful.

---

## 5. Suicide Attacks

The dataset contains:

- **175,058** non-suicide incidents
- **6,633** suicide incidents

Suicide attacks therefore represented a much smaller proportion of the total incidents.

---

## 6. Major Target Categories

Some of the most frequently recorded target categories were:

- Private Citizens & Property
- Military
- Police
- Government
- Business
- Transportation
- Utilities

Private Citizens & Property represented the largest target category in the dataset.

---

## 7. Regional Patterns

The analysis showed that the distribution of terrorist incidents was not consistent across regions or time periods.

The dominant regions changed considerably throughout the 47-year period.

This was one of the main reasons I included regional comparisons and time-based analysis in the Power BI dashboard.

---

# 📊 Dashboard Highlights

The Power BI dashboard was designed to allow the user to explore the data interactively.

Some of the key dashboard views include:

- Overall incident and casualty metrics
- Incident trends by year
- Regional analysis
- Country-level analysis
- Attack type distribution
- Weapon type distribution
- Terrorist organization analysis
- Casualty analysis
- Geographic mapping of incidents
- Interactive filters for exploring different years, regions, and categories

---

# 📁 Repository Structure

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
│       └── dashboard screenshots
│
├── sql/
│   └── terrorism_analysis.sql
│
├── .gitignore
│
└── README.md
```

---

# ▶️ How to Reproduce the Project

## 1. Obtain the Dataset

Download the **Global Terrorism Database (GTD)** separately.

The original dataset is not included in this repository because of its large file size.

---

## 2. Run the Jupyter Notebook

Open:

```text
notebooks/Global_Terrorism_analysis.ipynb
```

Update the dataset file path to the location of the downloaded CSV file on your computer.

Then run the notebook.

---

## 3. Generate the Dashboard Dataset

The notebook creates:

```text
GTD_dashboard.csv
```

This processed dataset contains the 23 selected analytical columns.

---

## 4. Set Up SQL Server

Create a SQL Server database named:

```text
GlobalTerrorism
```

Load the processed dataset into the:

```text
GTD_Dashboard
```

table.

The notebook also contains the Python code used to create this SQL Server table.

---

## 5. Run the SQL Analysis

Open:

```text
sql/terrorism_analysis.sql
```

Execute the queries in SQL Server Management Studio.

---

## 6. Open the Power BI Dashboard

Open:

```text
powerbi/Global Terrorism Analysis.pbix
```

using **Power BI Desktop**.

---

# ⚠️ Data & Reproducibility Notes

The Jupyter Notebook originally used a local Windows file path to access the raw dataset.

For example:

```python
file_path = r"C:\Users\lavan\Downloads\globalterrorismdb_0718dist.csv"
```

This path is specific to the development environment.

If reproducing the project on another computer, update the file path to the location of the downloaded dataset.

The original GTD dataset is not stored in this GitHub repository.

The processed `GTD_dashboard.csv` dataset is generated during the Python data preparation stage.

---

# ⚠️ Project Limitations

- The original dataset contains a substantial number of missing values in several variables.
- Some variables have extremely high percentages of missing data and were not required for this analysis.
- Location fields contain some missing latitude and longitude values.
- Casualty fields such as `nkill` and `nwound` also contain missing values.
- The analysis is based on the information available in the Global Terrorism Database.
- The dataset covers incidents recorded between 1970 and 2017 and therefore does not represent more recent events.
- The project focuses on descriptive analysis and visualization rather than predicting future terrorist activity.
- The results should be interpreted as patterns within the recorded dataset rather than explanations of the causes of terrorism.

---

# 📚 Data Source

The project is based on the **Global Terrorism Database (GTD)**, maintained by the National Consortium for the Study of Terrorism and Responses to Terrorism (START) at the University of Maryland.

The dataset used for this project covers terrorist incidents recorded between **1970 and 2017**.

---

# 👩‍💻 Project Author

**Lavanya Rokkamm**

This project demonstrates an end-to-end data analytics workflow using:

**Python → SQL Server → Power BI → GitHub**

### Important

When you paste this into GitHub's `README.md` **Edit** screen:

- `#` and `##` will become headings.
- `-` will become bullet points.
- The `|` sections will become tables.
- The sections surrounded by three backticks will become code blocks.
- The `---` lines will become separators.

So **do not remove the `#`, `|`, `-`, or backticks**. They are what tell GitHub how to format the README.

After pasting it, click **Preview** before committing. If the Preview looks good, then click **Commit changes**.

One small thing I deliberately did **not** include: your local Windows username/path as a prominent project detail beyond the reproducibility example. That's fine to show as an example, but you don't want the README to depend on your personal computer's folder structure.
