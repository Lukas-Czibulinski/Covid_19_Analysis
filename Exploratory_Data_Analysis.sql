/*
Covid 19 Data Exploration

Programs Used: MySQL and HeidiSQL for importing Datasets

Skills used: Joins, CTE's, (Windows Functions), Aggregate Functions, Creating Views, Converting Data Types 
*/

-- Disabling Safe mode if activated
SET SQL_SAFE_UPDATES = 0;

-- Inserting null values into the continent column for later queries since it does not add null values by default
update portfolioproject.coviddeaths
set continent = null 
where continent = '';

-- Getting an overview of the data

-- Table 1: covidddeaths
SELECT*
FROM portfolioproject.coviddeaths
WHERE continent is not null
order by 3,4;

-- Table 2: covidvaccinations
SELECT*
FROM portfolioproject.covidvaccinations
WHERE continent is not null
order by 3,4;


-- Select Data that we are going to be starting with
SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM portfolioproject.coviddeaths
WHERE continent is not null
order by 1,2;


-- Total Cases vs. Total Deaths

-- Shows likelihood of dying if you contract covid in Germany
SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM portfolioproject.coviddeaths
WHERE location like "%Germany%"
AND continent is not null
order by 1,2;


-- Total Cases vs. Population

-- Percent of Population infected with Covid over the course of time 
SELECT Location, date, population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
FROM portfolioproject.coviddeaths
WHERE continent is not null
-- AND location like "%Germany%" -- for looking at Germany seperately
order by 1,2;

-- All time High of the Population infected
Select Location, Population, sum(new_cases) as HighestInfectionCount,  (sum(new_cases)/population)*100 as PercentPopulationInfected
From portfolioproject.coviddeaths
-- Where location like '%Germany%'
Group by Location, Population
order by PercentPopulationInfected desc;

-- Total Deaths vs. Population
-- Countries with the most Deaths
Select location, max(cast(Total_deaths as unsigned)) as TotalDeathCount, Population, max(cast(Total_deaths as unsigned))/Population*100 as PercentPopulationDied
From PortfolioProject.coviddeaths
Where continent is not null 
-- AND location like '%Germany%'
Group by Location
order by TotalDeathCount desc;

-- Continents with the most Deaths
Select continent, max(cast(Total_deaths as unsigned)) as TotalDeathCount
From PortfolioProject.coviddeaths
Where continent is not null 
Group by continent
order by TotalDeathCount desc;

-- Total mortality rate worldwide
SELECT SUM(new_cases) as total_cases, sum(cast(new_deaths as unsigned)) as total_deaths, sum(cast(new_deaths as unsigned))/sum(new_cases)*100 as DeathPercentage
FROM portfolioproject.coviddeaths
WHERE continent is not null
-- AND location like "%Germany%"
order by 1,2;

-- Total mortality rate worldwide segregated by date
SELECT date, sum(total_cases) as total_cases, sum(total_deaths) as total_deaths, sum(total_deaths)/sum(total_cases)*100 as DeathPercentage
FROM portfolioproject.coviddeaths
WHERE continent is not null
-- AND location like "%Germany%"
GROUP BY date -- for investigating the development over the course of time
order by 1,2;

-- Total Population vs. Vaccinations

-- Shows Percentage of Population that has recieved at least one Covid Vaccine
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(cast(vac.new_vaccinations as unsigned)) over (Partition by dea.location order by dea.location,
 dea.date) as RollingPeopleVaccinated
FROM portfolioproject.coviddeaths dea
JOIN portfolioproject.covidvaccinations vac
	ON dea.location = vac.location
    and dea.date = vac.date
WHERE dea.continent is not null
order by 2,3;


-- Using CTE to perform Calculation  on Partition By in previous query
With PopvsVac (continent, location, date, population, new_vaccinations,  RollingPeopleVaccinated)
as 
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(cast(vac.new_vaccinations as unsigned)) over (Partition by dea.location order by dea.location,
dea.date) as RollingPeopleVaccinated
FROM portfolioproject.coviddeaths dea
JOIN portfolioproject.covidvaccinations vac
	ON dea.location = vac.location
    and dea.date = vac.date
WHERE dea.continent is not null
-- order by 2,3
)
SELECT *, (RollingPeopleVaccinated/Population)*100
FROM PopvsVac;

-- Creating View to store data for later visualizations
DROP VIEW IF exists percentpopulationvaccinated;

CREATE VIEW PercentPopulationVaccinated as 
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
sum(cast(vac.new_vaccinations as unsigned)) over (Partition by dea.location order by dea.location,
dea.date) as RollingPeopleVaccinated
FROM portfolioproject.coviddeaths dea
JOIN portfolioproject.covidvaccinations vac
	ON dea.location = vac.location
    and dea.date = vac.date
WHERE dea.continent is not null
-- order by 2,3
;

-- Reviewing the previously created View
SELECT*
From percentpopulationvaccinated;