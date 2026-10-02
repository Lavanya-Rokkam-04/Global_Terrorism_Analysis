```sql
/* =========================================================
   Global Terrorism Analysis
   SQL Server Analysis
   =========================================================

   Database : GlobalTerrorism
   Table    : GTD_Dashboard

   Purpose:
   Analyze historical terrorist incident data across time,
   geography, attack characteristics, organizations, weapons,
   and recorded casualties.
   ========================================================= */


/* =========================================================
   1. Regional Incident Trends and Share of Global Incidents
   ========================================================= */

WITH GlobalYear AS
(
    SELECT
        iyear,
        COUNT(*) AS global_incidents
    FROM GTD_Dashboard
    GROUP BY iyear
),
RegionYear AS
(
    SELECT
        iyear,
        region_txt,
        COUNT(*) AS regional_incidents
    FROM GTD_Dashboard
    GROUP BY
        iyear,
        region_txt
)
SELECT
    r.iyear,
    r.region_txt,
    r.regional_incidents,
    g.global_incidents,
    ROUND(
        100.0 * r.regional_incidents / g.global_incidents,
        2
    ) AS region_share_pct
FROM RegionYear AS r
JOIN GlobalYear AS g
    ON r.iyear = g.iyear
ORDER BY
    r.iyear,
    r.regional_incidents DESC;


/* =========================================================
   2. Annual Incident Volume and Recorded Casualties
   ========================================================= */

SELECT
    iyear,
    COUNT(*) AS incident_count,
    SUM(ISNULL(nkill, 0)) AS total_killed,
    SUM(ISNULL(nwound, 0)) AS total_wounded,
    SUM(ISNULL(nkill, 0) + ISNULL(nwound, 0)) AS total_casualties,
    ROUND(
        1.0 * SUM(ISNULL(nkill, 0) + ISNULL(nwound, 0))
        / COUNT(*),
        2
    ) AS casualties_per_incident
FROM GTD_Dashboard
GROUP BY iyear
ORDER BY iyear;


/* =========================================================
   3. Highest-Casualty Recorded Incidents
   ========================================================= */

SELECT TOP 10
    eventid,
    iyear,
    country_txt,
    region_txt,
    city,
    attacktype1_txt,
    targtype1_txt,
    ISNULL(nkill, 0) AS killed,
    ISNULL(nwound, 0) AS wounded,
    ISNULL(nkill, 0) + ISNULL(nwound, 0) AS total_casualties
FROM GTD_Dashboard
ORDER BY total_casualties DESC;


/* =========================================================
   4. Attack Type Analysis by Year and Region
   ========================================================= */

WITH AttackAnalysis AS
(
    SELECT
        iyear,
        region_txt,
        attacktype1_txt,
        COUNT(*) AS incident_count
    FROM GTD_Dashboard
    GROUP BY
        iyear,
        region_txt,
        attacktype1_txt
)
SELECT
    iyear,
    region_txt,
    attacktype1_txt,
    incident_count,

    SUM(incident_count) OVER (
        PARTITION BY attacktype1_txt
    ) AS overall_attack_count,

    SUM(incident_count) OVER (
        PARTITION BY region_txt, attacktype1_txt
    ) AS regional_attack_count

FROM AttackAnalysis
ORDER BY
    iyear,
    region_txt,
    incident_count DESC;


/* =========================================================
   5. Geographic Incident Data
   ========================================================= */

SELECT
    eventid,
    iyear,
    country_txt,
    region_txt,
    provstate,
    city,
    latitude,
    longitude,
    attacktype1_txt,
    ISNULL(nkill, 0) AS killed,
    ISNULL(nwound, 0) AS wounded,
    ISNULL(nkill, 0) + ISNULL(nwound, 0) AS total_casualties
FROM GTD_Dashboard
WHERE latitude IS NOT NULL
  AND longitude IS NOT NULL
ORDER BY
    region_txt,
    iyear;


/* =========================================================
   6. Country-Level Incident and Casualty Analysis
   ========================================================= */

SELECT TOP 20
    country_txt,
    COUNT(*) AS incident_count,
    SUM(ISNULL(nkill, 0)) AS total_killed,
    SUM(ISNULL(nwound, 0)) AS total_wounded,
    SUM(ISNULL(nkill, 0) + ISNULL(nwound, 0)) AS total_casualties
FROM GTD_Dashboard
GROUP BY country_txt
ORDER BY incident_count DESC;


/* =========================================================
   7. Terrorist Organizations Associated with Recorded Incidents
   ========================================================= */

SELECT TOP 20
    gname,
    COUNT(*) AS incident_count,
    SUM(ISNULL(nkill, 0)) AS total_killed,
    SUM(ISNULL(nwound, 0)) AS total_wounded,
    SUM(ISNULL(nkill, 0) + ISNULL(nwound, 0)) AS total_casualties
FROM GTD_Dashboard
WHERE gname IS NOT NULL
GROUP BY gname
ORDER BY incident_count DESC;


/* =========================================================
   8. Years with the Highest Incident Counts
   ========================================================= */

SELECT TOP 10
    iyear,
    COUNT(*) AS incident_count,
    SUM(ISNULL(nkill, 0)) AS total_killed,
    SUM(ISNULL(nwound, 0)) AS total_wounded,
    SUM(ISNULL(nkill, 0) + ISNULL(nwound, 0)) AS total_casualties
FROM GTD_Dashboard
GROUP BY iyear
ORDER BY incident_count DESC;


/* =========================================================
   9. Regional Incident and Casualty Analysis
   ========================================================= */

SELECT
    region_txt,
    COUNT(*) AS incident_count,
    SUM(ISNULL(nkill, 0)) AS total_killed,
    SUM(ISNULL(nwound, 0)) AS total_wounded,
    SUM(ISNULL(nkill, 0) + ISNULL(nwound, 0)) AS total_casualties
FROM GTD_Dashboard
GROUP BY region_txt
ORDER BY incident_count DESC;


/* =========================================================
   10. Attack Types Ranked by Recorded Casualties
   ========================================================= */

SELECT
    attacktype1_txt,
    COUNT(*) AS incident_count,
    SUM(ISNULL(nkill, 0)) AS total_killed,
    SUM(ISNULL(nwound, 0)) AS total_wounded,
    SUM(ISNULL(nkill, 0) + ISNULL(nwound, 0)) AS total_casualties
FROM GTD_Dashboard
GROUP BY attacktype1_txt
ORDER BY total_casualties DESC;


/* =========================================================
   11. Weapon Type Analysis
   ========================================================= */

SELECT
    weaptype1_txt AS weapon_type,
    COUNT(*) AS incident_count,
    SUM(ISNULL(nkill, 0)) AS total_killed,
    SUM(ISNULL(nwound, 0)) AS total_wounded,
    SUM(ISNULL(nkill, 0) + ISNULL(nwound, 0)) AS total_casualties
FROM GTD_Dashboard
GROUP BY weaptype1_txt
ORDER BY incident_count DESC;


/* =========================================================
   12. Attack Success Classification
   ========================================================= */

SELECT
    success,
    COUNT(*) AS incident_count
FROM GTD_Dashboard
GROUP BY success
ORDER BY success DESC;


/* =========================================================
   13. Suicide Incident Classification
   ========================================================= */

SELECT
    suicide,
    COUNT(*) AS incident_count
FROM GTD_Dashboard
GROUP BY suicide
ORDER BY suicide DESC;
```
