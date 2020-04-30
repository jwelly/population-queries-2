-- How many entries in the database are from Africa?

SELECT COUNT(*)
FROM countries
WHERE continent = 'Africa';

-- What was the total population of Oceania in 2005?

SELECT ROUND(SUM(population), 2) AS 'Population of Oceania in 2005 (in millions)'
FROM population_years
JOIN countries
	ON countries.id = population_years.country_id
WHERE continent = 'Oceania' AND year = 2005;

-- What is the average population of countries in South America in 2003?

SELECT ROUND(AVG(population_years.population), 2) AS 'Average population of South America in 2003'
FROM population_years
JOIN countries
	ON countries.id = population_years.country_id
WHERE countries.continent = 'South America' AND population_years.year = 2003;

-- What country had the smallest population in 2007?

SELECT countries.name AS 'Country with the lowest population in 2007', MIN(population_years.population) AS 'Population (in millions)'
FROM population_years
JOIN countries
	ON countries.id = population_years.country_id
WHERE population_years.year = 2007;

-- What is the average population of Poland during the time period covered by this dataset?

SELECT countries.name AS 'Country', ROUND(AVG(population_years.population), 2) AS 'Average population between 2000 and 2010 (in millions)'
FROM population_years
JOIN countries
	ON population_years.country_id = countries.id
WHERE countries.name = 'Poland';

-- How many countries have the word "The" in their name?

SELECT COUNT(name) AS 'Number of countries containing the word "The"'
FROM countries
WHERE name LIKE '% The%';

-- What was the total population of each continent in 2010?

SELECT countries.continent AS 'Continent', ROUND(SUM(population_years.population), 2) AS 'Total population in 2010'
FROM countries
JOIN population_years
	ON countries.id = population_years.country_id
WHERE population_years.year = 2010
GROUP BY 1
ORDER BY 2 DESC;
