
ALTER TABLE `electricity-demand`
RENAME COLUMN `Share of total electricity demand coming from data centers` TO total_electricity_demand;
ALTER TABLE `electricity-demand`
RENAME COLUMN total_electricity_demand TO total_electricity_demand_pct;


-- Increased pct of each country yearly
SELECT 
    entity,
    year,
    total_electricity_demand_pct,
    LAG(total_electricity_demand_pct) OVER (PARTITION BY entity ORDER BY year) AS prev_year_demand,
    ((total_electricity_demand_pct - LAG(total_electricity_demand_pct) OVER (PARTITION BY entity ORDER BY year)) 
     / LAG(total_electricity_demand_pct) OVER (PARTITION BY entity ORDER BY year)) * 100 
     AS pct_increase
FROM (
    SELECT 
        entity,
        year,
        total_electricity_demand_pct
    FROM `electricity-demand`
   
) t
ORDER BY 2,5 DESC;