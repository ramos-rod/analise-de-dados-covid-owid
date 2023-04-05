
SELECT * 
FROM ProjetoPortfolio..CovidDeaths
ORDER BY 3,4


-- Selecionar dados a serem usados
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM ProjetoPortfolio..CovidDeaths
ORDER BY 1, 2

-- Convertendo colunas para tipo de dado "numeric" para opera��es
ALTER TABLE dbo.CovidDeaths ALTER COLUMN total_deaths numeric
ALTER TABLE dbo.CovidDeaths ALTER COLUMN total_cases numeric
ALTER TABLE dbo.CovidDeaths ALTER COLUMN population numeric
ALTER TABLE dbo.CovidDeaths ALTER COLUMN new_cases numeric
ALTER TABLE dbo.CovidDeaths ALTER COLUMN new_deaths numeric
ALTER TABLE dbo.CovidVaccinations ALTER COLUMN new_vaccinations numeric
ALTER TABLE dbo.CovidDeaths ALTER COLUMN date date

-- Apresenta a taxa de mortalidade da Covid ao longo do tempo em um determinado pa�s.
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM ProjetoPortfolio..CovidDeaths
WHERE location like 'Brazil'
ORDER BY date

-- Apresenta a taxa de mortalidade da Covid, por continente.
SELECT location, CAST(SUM(new_deaths)/SUM(new_cases)*100 AS numeric(16,2)) AS mortality_rate
FROM ProjetoPortfolio..CovidDeaths
WHERE continent IS NULL and location NOT LIKE '%income' 
AND location not in ('World', 'European Union', 'International')
GROUP BY location
ORDER BY mortality_rate DESC

-- Apresenta a contagem total de mortes por Covid, por continente.

SELECT location, SUM(new_deaths) AS total_deaths
FROM ProjetoPortfolio..CovidDeaths
WHERE continent IS NULL and location NOT LIKE '%income' 
AND location not in ('World', 'European Union', 'International')
GROUP BY location
ORDER BY total_deaths DESC

-- Observando a propor��o de infectados por Covid em rela��o a popula��o em cada pa�s
SELECT location, population, MAX(total_cases) AS infection_count, MAX(CAST(total_cases/population*100 AS numeric(16,3))) AS infection_rate -- <-- usa-se CAST para converter o tipo de dados e facilitar a importa��o de dados percentuais para excel e tableau, respectivamente.
FROM ProjetoPortfolio..CovidDeaths
GROUP BY location, population
ORDER BY infection_rate DESC

-- Observando os pa�ses com os maiores n�meros absolutos de mortes
SELECT location, MAX(total_deaths) AS DeathCount
FROM ProjetoPortfolio..CovidDeaths
WHERE continent IS NOT NULL -- <-- nas linhas em que 'continent' � NULL, 'location' representa o agrupamento de todo um continente. Removendo NULL, tem-se os valores de cada pa�s.
GROUP BY location
ORDER BY DeathCount DESC
 

-- Observando o total de casos e taxa de infec��o por pa�s ao longo do tempo.
SELECT location, date, population, MAX(total_cases) AS infection_count, MAX(CAST(total_cases/population*100 AS numeric(16,2))) AS infection_rate
FROM ProjetoPortfolio..CovidDeaths
GROUP BY location, date, population
ORDER BY infection_rate DESC

-- Observa��es globais (total casos, total mortes, taxa de mortalidade)
SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, CAST(SUM(new_deaths)/SUM(new_cases)*100 AS numeric(16,2)) AS mortality_rate_percent
FROM ProjetoPortfolio..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1, 2

-- Observa��es globais ('', por pa�s)

SELECT location, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, CAST(SUM(new_deaths)/SUM(new_cases)*100 AS numeric(16,2)) AS mortality_rate_percent
FROM ProjetoPortfolio..CovidDeaths
WHERE continent IS NOT NULL and location NOT IN ('North Korea')
GROUP BY location
ORDER BY mortality_rate_percent DESC

-- tabela CovidVaccinations
-- Observando popula��o total vs vacina��es
SELECT deaths.continent, deaths.location, deaths.date, deaths.population, vaxx.new_vaccinations
, SUM(vaxx.new_vaccinations) OVER (PARTITION BY deaths.location ORDER BY deaths.location, 
  deaths.date) AS total_vaccinations -- determinando vacina��o total (j� presenta na tabela original) manualmente.
FROM ProjetoPortfolio..CovidDeaths deaths
JOIN ProjetoPortfolio..CovidVaccinations vaxx
	ON deaths.location = vaxx.location 
	AND deaths.date = vaxx.date
WHERE deaths.continent IS NOT NULL
ORDER BY 2, 3

-- TABELA TEMPORARIA

DROP TABLE IF EXISTS #PercentualPopVacinada
CREATE TABLE #PercentualPopVacinada
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
total_vaccinations numeric
)

INSERT INTO #PercentualPopVacinada
SELECT deaths.continent, deaths.location, deaths.date, deaths.population, vaxx.new_vaccinations
, SUM(vaxx.new_vaccinations) OVER (PARTITION BY deaths.location ORDER BY deaths.location, 
  deaths.date) AS total_vaccinations
FROM ProjetoPortfolio..CovidDeaths deaths
JOIN ProjetoPortfolio..CovidVaccinations vaxx
	ON deaths.location = vaxx.location 
	AND deaths.date = vaxx.date
WHERE deaths.continent IS NOT NULL


SELECT *, (total_vaccinations/population)*100 AS percent_vaccinated
FROM #PercentualPopVacinada


-- Criando VIEW para armazenar dados para visualiza��o posterior

CREATE VIEW PercentualPopVacinada as
SELECT deaths.continent, deaths.location, deaths.date, deaths.population, vaxx.new_vaccinations
, SUM(vaxx.new_vaccinations) OVER (PARTITION BY deaths.location ORDER BY deaths.location, 
  deaths.date) AS total_vaccinations, (total_vaccinations/population)*100 AS percent_pop_vaccinated
FROM ProjetoPortfolio..CovidDeaths deaths
JOIN ProjetoPortfolio..CovidVaccinations vaxx
	ON deaths.location = vaxx.location 
	AND deaths.date = vaxx.date
WHERE deaths.continent IS NOT NULL


SELECT *
FROM PercentualPopVacinada