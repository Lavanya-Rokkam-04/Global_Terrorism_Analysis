-- The number of terrorist activities changed over the years,and the trend varied across different regions.

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
FROM RegionYear r
JOIN GlobalYear g
    ON r.iyear = g.iyear
ORDER BY
    r.iyear,
    r.regional_incidents DESC;

/* Regional pattern

There are very clear differences from the global pattern.

1970s: Western Europe and North America account for a large share.
1980s: South America and Central America & Caribbean become major contributors.
1990s: South America, South Asia, and Middle East & North Africa become more prominent.
2000s onward: Middle East & North Africa and South Asia become dominant.
2014: Middle East & North Africa accounts for 41.05% of incidents.
2016: Middle East & North Africa reaches 45.01%.
2017: Middle East & North Africa is still the largest at 34.68%, followed by South Asia at 31.47% and Sub-Saharan Africa at 18.07%.
Final answer you can put in your project

The number of terrorist activities fluctuated considerably between 1970 and 2017, with an overall increase over the long term. 
Global incidents reached their highest level in 2014, with 16,903 recorded incidents, before declining through 2017. 
The regional trend differs significantly from the global pattern. 
Western Europe and North America accounted for a large share of incidents during the 1970s, 
while South America and Central America & Caribbean became more prominent during the 1980s. From the 2000s onward, 
Middle East & North Africa and South Asia became the dominant regions, accounting for a large proportion of global terrorist incidents.
*/

-- The number of incidents and casualties can be compared to identify the relationship and possible outliers.

SELECT
    iyear,
    COUNT(*) AS incident_count,
    SUM(ISNULL(nkill, 0)) AS total_killed,
    SUM(ISNULL(nwound, 0)) AS total_wounded,
    SUM(ISNULL(nkill, 0) + ISNULL(nwound, 0)) AS total_casualties,
    ROUND(
        1.0 * SUM(ISNULL(nkill, 0) + ISNULL(nwound, 0)) / COUNT(*),
        2
    ) AS casualties_per_incident
FROM GTD_Dashboard
GROUP BY iyear
ORDER BY iyear;

-- Identify the incidents with the highest number of casualties.

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

-- Q3: Analyze the most common terrorist attack methods,
-- differences across regions, and changes over time.

WITH attack_analysis AS
(
    SELECT
        iyear,
        region_txt,
        attacktype1_txt,
        COUNT(*) AS incident_count
    FROM GTD_dashboard
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

FROM attack_analysis
ORDER BY
    iyear,
    region_txt,
    incident_count DESC;

-- The locations of attacks on a map to visualize their spread.

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
FROM GTD_dashboard
WHERE latitude IS NOT NULL
  AND longitude IS NOT NULL
ORDER BY
    region_txt,
    iyear;

-- The countries with the highest number of terrorist incidents.

SELECT TOP 20
    country_txt,
    COUNT(*) AS incident_count,
    SUM(ISNULL(nkill, 0)) AS total_killed,
    SUM(ISNULL(nwound, 0)) AS total_wounded,
    SUM(ISNULL(nkill, 0) + ISNULL(nwound, 0)) AS total_casualties
FROM GTD_dashboard
GROUP BY country_txt
ORDER BY incident_count DESC;

-- The terrorist groups responsible for the highest number of incidents.

SELECT TOP 20
    gname,
    COUNT(*) AS incident_count,
    SUM(ISNULL(nkill, 0)) AS total_killed,
    SUM(ISNULL(nwound, 0)) AS total_wounded,
    SUM(ISNULL(nkill, 0) + ISNULL(nwound, 0)) AS total_casualties
FROM GTD_dashboard
WHERE gname IS NOT NULL
GROUP BY gname
ORDER BY incident_count DESC;

-- The years with the highest number of terrorist incidents.

SELECT TOP 10
    iyear,
    COUNT(*) AS incident_count,
    SUM(ISNULL(nkill, 0)) AS total_killed,
    SUM(ISNULL(nwound, 0)) AS total_wounded,
    SUM(ISNULL(nkill, 0) + ISNULL(nwound, 0)) AS total_casualties
FROM GTD_dashboard
GROUP BY iyear
ORDER BY incident_count DESC;

-- The regions with the highest number of terrorist incidents and casualties.

SELECT
    region_txt,
    COUNT(*) AS incident_count,
    SUM(ISNULL(nkill, 0)) AS total_killed,
    SUM(ISNULL(nwound, 0)) AS total_wounded,
    SUM(ISNULL(nkill, 0) + ISNULL(nwound, 0)) AS total_casualties
FROM GTD_dashboard
GROUP BY region_txt
ORDER BY incident_count DESC;

-- The attack types with the highest number of casualties.

SELECT
    attacktype1_txt,
    COUNT(*) AS incident_count,
    SUM(ISNULL(nkill, 0)) AS total_killed,
    SUM(ISNULL(nwound, 0)) AS total_wounded,
    SUM(ISNULL(nkill, 0) + ISNULL(nwound, 0)) AS total_casualties
FROM GTD_dashboard
GROUP BY attacktype1_txt
ORDER BY total_casualties DESC;
