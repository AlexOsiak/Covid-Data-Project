USE covidata_project;
SELECT * FROM coviddeaths;
RENAME TABLE covidata_project.coviddeaths TO covidata_project.Deaths;
SELECT * FROM Covidata_project.Deaths ORDER BY 3,4;
SELECT * FROM Covidata_project.Vaccinations ORDER BY 3,4;
SELECT * FROM Deaths;
SELECT * FROM vaccinations;

##DATA EXPLORATION
SELECT 
    Location,
    date,
    total_cases,
    new_cases,
    total_deaths,
    population
FROM
    deaths
ORDER BY Location;

#Total Cases vs Total Deaths (How many people died after getting COVID?)
#Shows likelihood of dying if you contract covid in for example Poland
SELECT 
    Location,
    date,
    total_cases,
    total_deaths,
    ROUND((total_deaths / total_cases) * 100, 4) AS Death_percentage
FROM
    deaths
WHERE
    continent IS NOT NULL;
#Poland
SELECT 
    Location,
    date,
    total_cases,
    total_deaths,
    ROUND((total_deaths / total_cases) * 100, 4) AS Death_percentage
FROM
    deaths
WHERE
    location = 'Poland'
        AND continent IS NOT NULL;

#Total cases vs Population 
#Shows what percentage of population got Covid
SELECT 
    Location,
    date,
    Population,
    total_cases,
    ROUND((total_cases / Population) * 100, 4) AS InfectedPopulationRate
FROM
    deaths;
#Poland 
SELECT 
    Location,
    date,
    Population,
    total_cases,
    ROUND((total_cases / Population) * 100, 4) AS PopulationVSCases
FROM
    deaths
WHERE
    location = 'Poland';

#Countries with highest infection rate compared to Population 
SELECT 
    Location,
    Population,
    MAX(total_cases) AS HighestInfectionCount,
    ROUND(MAX((total_cases / Population)) * 100, 4) AS InfectedPopulationRate
FROM
    deaths
GROUP BY Location , Population
ORDER BY InfectedPopulationRate DESC;

#Countries with the highest Deatch Count per Population 
ALTER TABLE Deaths MODIFY COLUMN total_deaths INT;
#Grouped by location 
SELECT 
    Location, MAX(total_deaths) AS TotalDeathCount
FROM
    deaths
WHERE
    continent IS NOT NULL
GROUP BY Location
ORDER BY TotalDeathCount DESC;

#Continents with the highest death count per population 
SELECT 
    continent, MAX(total_deaths) AS TotalDeathCount
FROM
    deaths
WHERE
    continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC;

#Global numbers of new cases and death by date 
ALTER TABLE Deaths MODIFY COLUMN new_deaths INT;
ALTER TABLE Deaths MODIFY COLUMN new_cases INT;
SELECT 
    date,
    SUM(new_cases) AS Total_Cases,
    SUM(new_deaths) AS Total_Deaths,
    SUM(new_deaths / new_cases) * 100 AS DeathPercentage
FROM
    Deaths
WHERE
    continent IS NOT NULL
GROUP BY date;
