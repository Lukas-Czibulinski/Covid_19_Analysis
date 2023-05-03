/*
Queries used for a Tableau Dashboard
*/

-- 1.Table: Percentage of dying with covid
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as unsigned)) as total_deaths, SUM(cast(new_deaths as unsigned))/SUM(New_Cases)*100 as DeathPercentage
From portfolioproject.coviddeaths
where continent is not null 
-- AND location like "%Germany%" -- for looking at the german data
order by 1,2;

-- 2.Table: Percentage of dying with covid split into continents
Select location, SUM(cast(new_deaths as unsigned)) as TotalDeathCount
From portfolioproject.coviddeaths
Where continent is null 
and location not in ('World', 'European Union', 'International') -- ignoring some duplicated not usable values
and location not like '%income'
Group by location
order by TotalDeathCount desc;

-- 3.Table: Highest percent of the population infected at any time split into countries
Select Location, Population, sum(new_cases) as HighestInfectionCount,  (sum(new_cases)/population)*100 as PercentPopulationInfected
From portfolioproject.coviddeaths
-- Where location like '%Germany%'
Group by Location, Population
order by PercentPopulationInfected desc;

-- 4.Table: Development of highest infection rate 
Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From portfolioproject.coviddeaths
-- Where location like '%Germany%'
Group by Location, Population, date
order by PercentPopulationInfected desc;

-- 5. death percentage by continent
Select continent, SUM(new_cases) as total_cases, SUM(cast(new_deaths as unsigned)) as total_deaths, SUM(cast(new_deaths as unsigned))/SUM(New_Cases)*100 as DeathPercentage
From portfolioproject.coviddeaths
where continent is not null 
-- AND location like "%Germany%"
Group By continent
order by 1,2;

-- 6. development of likelyhood to die on covid
Select Location, date, population, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject.CovidDeaths
where continent is not null 
-- AND location like '%Germany%'
GROUP BY date, Location
order by 1,2;

-- 7. development of tests and vaccinations
SELECT dea.continent, dea.location, dea.date, dea.population, vac.total_vaccinations, vac.people_fully_vaccinated, vac.new_tests
FROM portfolioproject.coviddeaths dea
JOIN portfolioproject.covidvaccinations vac
	ON dea.location = vac.location
    and dea.date = vac.date
WHERE dea.continent is not null
order by 2,3;