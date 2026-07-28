-- Queries for vizualizations
-- Table 1 KPI

Select SUM(new_cases) as total_cases, 
SUM(new_deaths) as total_deaths, 
SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage
From CovidDeaths
where continent is not null 
order by 1,2;

-- Table 2
-- Number of deaths by continent
Select location, SUM(new_deaths) as TotalDeathCount
From CovidDeaths
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc;

-- Table 3
-- % od infected by country

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From CovidDeaths
Group by Location, Population
order by PercentPopulationInfected desc;

-- Table 4
-- % of intected population daily by country
Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From CovidDeaths
Group by Location, Population, date
order by PercentPopulationInfected desc;