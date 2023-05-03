/*

Covid 19 Data Loading with HeidiSQL since MySQL was not able to load the tables accordingly

*/


-- Table: Coviddeaths
CREATE TABLE `portfolioproject`.`coviddeaths` (
	`iso_code` VARCHAR(40) NOT NULL,
	`continent` VARCHAR(40) NULL,
	`location` VARCHAR(40) NULL,
	`date` DATE NOT NULL,
	`population` VARCHAR(40) NULL,
	`total_cases` VARCHAR(40) NULL,
	`new_cases` VARCHAR(40) NULL,
	`new_cases_smoothed` VARCHAR(40) NULL,
	`total_deaths` VARCHAR(40) NULL,
	`new_deaths` VARCHAR(40) NULL,
	`new_deaths_smoothed` VARCHAR(40) NULL,
	`total_cases_per_million` VARCHAR(40) NULL,
	`new_cases_per_million` VARCHAR(40) NULL,
	`new_cases_smoothed_per_million` VARCHAR(40) NULL,
	`total_deaths_per_million` VARCHAR(40) NULL,
	`new_deaths_per_million` VARCHAR(40) NULL,
	`new_deaths_smoothed_per_million` VARCHAR(40) NULL,
	`reproduction_rate` VARCHAR(40) NULL,
	`icu_patients` VARCHAR(40) NULL,
	`icu_patients_per_million` VARCHAR(40) NULL,
	`hosp_patients` VARCHAR(40) NULL,
	`hosp_patients_per_million` VARCHAR(40) NULL,
	`weekly_icu_admissions` VARCHAR(40) NULL,
	`weekly_icu_admissions_per_million` VARCHAR(40) NULL,
	`weekly_hosp_admissions` VARCHAR(40) NULL,
	`weekly_hosp_admissions_per_million` VARCHAR(40) NULL
);


-- Table: Covidvaccinations
CREATE TABLE `portfolioproject`.`covidvaccinations` (
	`iso_code` VARCHAR(40) NOT NULL,
	`continent` VARCHAR(40) NULL,
	`location` VARCHAR(40) NULL,
	`date` DATE NOT NULL,
	`new_tests` VARCHAR(40) NULL,
	`total_tests_per_thousand` VARCHAR(40) NULL,
	`new_tests_per_thousand` VARCHAR(40) NULL,
	`new_tests_smoothed` VARCHAR(40) NULL,
	`new_tests_smoothed_per_thousand` VARCHAR(40) NULL,
	`positive_rate` VARCHAR(40) NULL,
	`tests_per_case` VARCHAR(40) NULL,
	`tests_units` VARCHAR(40) NULL,
	`total_vaccinations` VARCHAR(40) NULL,
	`people_vaccinated` VARCHAR(40) NULL,
	`people_fully_vaccinated` VARCHAR(40) NULL,
	`total_boosters` VARCHAR(40) NULL,
	`new_vaccinations` VARCHAR(40) NULL,
	`new_vaccinations_smoothed` VARCHAR(40) NULL,
	`total_vaccinations_per_hundred` VARCHAR(40) NULL,
	`people_vaccinated_per_hundred` VARCHAR(40) NULL,
	`people_fully_vaccinated_per_hundred` VARCHAR(40) NULL,
	`total_boosters_per_hundred` VARCHAR(40) NULL,
	`new_vaccinations_smoothed_per_million` VARCHAR(40) NULL,
	`new_people_vaccinated_smoothed` VARCHAR(40) NULL,
	`new_people_vaccinated_smoothed_per_hundred` VARCHAR(40) NULL,
	`stringency_index` VARCHAR(40) NULL,
	`population_density` VARCHAR(40) NULL,
	`median_age` VARCHAR(40) NULL,
	`aged_65_older` VARCHAR(40) NULL,
	`aged_70_older` VARCHAR(40) NULL,
	`gdp_per_capita` VARCHAR(40) NULL,
	`extreme_poverty` VARCHAR(40) NULL,
	`cardiovasc_death_rate` VARCHAR(40) NULL,
	`diabetes_prevalence` VARCHAR(40) NULL,
	`female_smokers` VARCHAR(40) NULL,
	`male_smokers` VARCHAR(40) NULL,
	`handwashing_facilities` VARCHAR(40) NULL,
	`hospital_beds_per_thousand` VARCHAR(40) NULL,
	`life_expectancy` VARCHAR(40) NULL,
	`human_development_index` VARCHAR(40) NULL,
	`excess_mortality_cumulative_absolute` VARCHAR(40) NULL,
	`excess_mortality_cumulative` VARCHAR(40) NULL,
	`excess_mortality` VARCHAR(40) NULL,
	`excess_mortality_cumulative_per_million` VARCHAR(40) NULL
);