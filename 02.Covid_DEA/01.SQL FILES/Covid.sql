SELECT *
FROM CovidDeaths;
SELECT *
FROM CovidVaccinations;

-- SELECT DATA TO USE

SELECT
location, date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths
ORDER BY 1,2;

-- Looking at Total Cases vs Total Deaths
SELECT 
location, date, total_cases, total_deaths,
ROUND((total_deaths/total_cases)*100,2) as pct_deaths
FROM CovidDeaths
WHERE location = 'Brazil'
ORDER BY 1,2;

-- Looking at Total Cases vs Population
-- Shows pct of population infected
SELECT 
location, date, total_cases, population,
ROUND((total_cases/population)*100,2) as pct_population_infected
FROM CovidDeaths
ORDER BY 1,2;

-- Countries with highiest infection rate compared to population 
SELECT 
location, population, MAX(total_cases) as Highiest_infection_count,
ROUND(Max(total_cases/population)*100,2) as pct_population_infected
FROM CovidDeaths
GROUP BY location, population
ORDER BY pct_population_infected DESC;

-- Show countries with highiest death count per population 
SELECT 
location, SUM(total_deaths) as total_death_count
FROM CovidDeaths
WHERE continent is not null
GROUP BY location
ORDER BY total_death_count DESC;

-- By continent
SELECT 
continent, SUM(total_deaths) as total_death_count
FROM CovidDeaths
WHERE continent is not null
GROUP BY continent
ORDER BY total_death_count DESC;


-- Global numbers
SELECT 
SUM(new_cases) as new_cases,SUM(CAST(new_deaths AS DECIMAL(10,0))) AS total_deaths,
SUM(CAST(new_deaths AS DECIMAL(10,2)))/SUM(new_cases)*100 as death_pct
FROM CovidDeaths
WHERE continent is not null
ORDER BY 1,2;

------------------- 
-- total polulation vs vaccination
WITH population_vaccines as (
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER( PARTITION BY dea.location ORDER BY dea.location, dea.date) as rolling_people_vaccinated
FROM CovidDeaths dea
JOIN CovidVaccinations vac
	ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3)

SELECT location, 
MAX(rolling_people_vaccinated)/population*100 as pct_people_vaccinated
FROM population_vaccines
GROUP BY location, population ;


-- TEMP TABLE 
DROP TABLE IF EXISTS pct_people_vaccinated;
CREATE TABLE pct_people_vaccinated 
(
Continent varchar (255), 
Location varchar (255),
Date DATE, 
Population INT,
New_Vaccinations INT,
Rolling_people_vaccinated INT
);

INSERT INTO pct_people_vaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER( PARTITION BY dea.location ORDER BY dea.location, dea.date) as rolling_people_vaccinated
FROM CovidDeaths dea
JOIN CovidVaccinations vac
	ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3;

SELECT location, 
MAX(rolling_people_vaccinated)/population*100 as pct_people_vaccinated
FROM pct_people_vaccinated
GROUP BY location, population ;

-- CREATE VIEW TO STORE DATA FOR LATER VIZ

CREATE VIEW pct_people_vaccinnes AS (
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER( PARTITION BY dea.location ORDER BY dea.location, dea.date) as rolling_people_vaccinated
FROM CovidDeaths dea
JOIN CovidVaccinations vac
	ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3);



