SELECT *
FROM Coral_Bleaching_2020




-- Exploratory analysis


--- 1. Bleaching trend analysis
SELECT Month, Bleaching_Status
FROM Coral_Bleaching_2020
ORDER BY Month


-- 2. Genera response to thermal stress/bleaching
SELECT Genus_Name, Bleaching_Status
FROM Coral_Bleaching_2020
ORDER BY Genus_Name

-- 3. Peak Bleaching and Final Bleaching analysis in April and June 2020/ Bleaching severity

-- use case statement/conditional statement

SELECT 
Site,
MAX(CASE WHEN Month= 'February' then Bleaching_Status ELSE '' END) AS February,

MAX(CASE WHEN Month= 'March' then Bleaching_Status ELSE '' END) AS March,

MAX(CASE WHEN Month= 'April' then Bleaching_Status ELSE '' END) AS April,

MAX(CASE WHEN Month= 'May' then Bleaching_Status ELSE '' END) AS May,

MAX(CASE WHEN Month= 'June' then Bleaching_Status ELSE '' END) AS June
FROM Coral_Bleaching_2020
GROUP BY Site



-- 4. Management regime effects on the level of bleaching observed
SELECT Month, Site, Management_Regime, Bleaching_Status
FROM Coral_Bleaching_2020
ORDER BY Month

-- Compare bleaching and recovery levels across different management regimes 
-- Convert 'partially bleached to white'

SELECT
Month, Management_Regime,
COUNT(CASE WHEN Month='June' AND Bleaching_Status= 'White'  THEN Bleaching_Status ELSE '' END ) AS White,

COUNT(CASE WHEN  Month='June' AND Bleaching_Status= 'Partially bleached' THEN Bleaching_Status ELSE '' END) AS Partially_bleached,

COUNT(CASE WHEN Month='June' AND Bleaching_Status= 'Recovered' THEN Bleaching_Status ELSE '' END ) AS Recovered,

COUNT(CASE WHEN Month='June' AND Bleaching_Status= 'Partly dead' THEN Bleaching_Status ELSE '' END) AS Partly_dead,

COUNT(CASE WHEN Month='June' AND Bleaching_Status= 'Recently dead' THEN Bleaching_Status ELSE '' END) AS Recently_dead

FROM Coral_Bleaching_2020
GROUP BY Month, Management_Regime
ORDER BY Month


SELECT
Management_Regime,
COUNT(CASE WHEN Management regime='June' AND Bleaching_Status= 'White'  THEN Bleaching_Status ELSE '' END ) AS White,

COUNT(CASE WHEN  Month='June' AND Bleaching_Status= 'Partially bleached' THEN Bleaching_Status ELSE '' END) AS Partially_bleached,

COUNT(CASE WHEN Month='June' AND Bleaching_Status= 'Recovered' THEN Bleaching_Status ELSE '' END ) AS Recovered,

COUNT(CASE WHEN Month='June' AND Bleaching_Status= 'Recently dead' THEN Bleaching_Status ELSE '' END) AS Recently_dead

FROM Coral_Bleaching_2020
GROUP BY Management_Regime



SELECT *
FROM Coral_Bleaching_2020
ORDER BY Month


-- Sites under study

SELECT Site,Transect_Line, Month, Bleaching_Status
GROUP BY Month, site, Transect_Line
ORDER BY Month
