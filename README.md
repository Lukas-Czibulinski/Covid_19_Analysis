# Covid_19_Analysis

## An indepth Analysis of the real world data of Covid-19


The goal of this project is to examine the global numbers of the Covid-19 pandemic and to further investigate the relation of the death and vaccination numbers within a final Tableau Dashboard which can be found on my Tableau Public "public.tableau.com/app/profile/lukas.czibulinski". The dataset for this project was downloaded in February 2023 from the website "https://ourworldindata.org" and and has therefore data until that date.

The implementation of the project involved the following steps:
 * Downloading the dataset from the website "ourworldindata.org/explorers/coronavirus-data-explorer" or alternatively from this GitHub repository: "github.com/owid/covid-19-data/tree/master/public/data"
 * Splitting the dataset into two subset named CovidDeaths and Covidvaccination via Microsoft Excel 
 * Loading the datasets into a MySQL Database using HeidiSQL
 * Some exploratory data analysis and data cleaning using MySQL
 * Preprocessing the data for the Tableau Dashboard and creating a View of the data
 *  Saving the preprocessed data as seperate Excel files for the Dashboard
 *  Creating the final Dashboard in Tableau
