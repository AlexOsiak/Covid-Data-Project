USE covidata_project;

##DATA VISUALIZATION

#1 Visualization of Global number of total cases and deaths
SELECT 
    SUM(new_cases) AS total_cases,
    SUM(new_deaths) AS total_deaths,
    (SUM(new_deaths) / SUM(new_cases)) * 100 AS DeathPercentage
FROM
    Deaths
WHERE
    continent IS NOT NULL
ORDER BY 1 , 2;

#2 Visualization Number of deaths by continents 
SELECT 
    continent, SUM(new_deaths) AS TotalDeathCount
FROM
    Deaths
WHERE
	continent IS NOT NULL
		AND location NOT IN ('World' , 'European Union', 'International')
GROUP BY continent
ORDER BY TotalDeathCount DESC;

#3 Vizualiaztion 
ALTER TABLE Deaths MODIFY COLUMN total_cases INT;
ALTER TABLE Deaths MODIFY COLUMN population INT;
SELECT 
    location,
    population,
    MAX(total_cases) AS HighestInfectionCount,
    MAX((total_cases / population)) * 100 AS PercentPopulationInfected
FROM
    Deaths
GROUP BY location , population
ORDER BY PercentPopulationInfected DESC;


#4 Visualization 
SELECT 
    Location,
    Population,
    date,
    MAX(total_cases) AS HighestInfectionCount,
    MAX((total_cases / population)) * 100 AS PercentPopulationInfected
FROM
    Deaths
GROUP BY location , population, date
ORDER BY date DESC;
