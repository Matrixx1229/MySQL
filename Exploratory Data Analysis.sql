-- Exploratory Data Analysis 
USE world_layoffs;

SELECT
    *
FROM
    layoffs_staging2;

SELECT
    MAX(total_laid_off),
    MAX(percentage_laid_off)
FROM
    layoffs_staging2;

SELECT
    *
FROM
    layoffs_staging2
WHERE
    percentage_laid_off = 1
ORDER BY
    total_laid_off DESC 

