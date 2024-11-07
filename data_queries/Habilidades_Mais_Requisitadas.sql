-- Objetivo da consulta: Entender a relação entre as melhores oportunidades para Analista de Dados em 2023 no Brasil com as habilidades mais requisitadas --
-- Query Objective: Comprehend the relashionship between the best job oportunities for Data Analytics at 2023 in Brazil and the most requested habilities --

SELECT
    jpf.job_id AS Número_de_Identificação,
    jpf.job_title AS Cargo,
    cd.name AS Empresa, 
    jpf.job_schedule_type AS Tipo_de_Horário, 
    jpf.job_location AS Localizaçao,
    jpf.salary_year_avg AS Salário_Em_US
FROM 
    job_postings_fact AS jpf
    LEFT JOIN company_dim AS cd ON cd.company_id = jpf.company_id
WHERE
    (job_title_short = 'Data Analyst') AND 
    (job_location LIKE '%Brazil%') AND
    (salary_year_avg IS NOT NULL) AND
    (EXTRACT(YEAR FROM job_posted_date) = 2023)
ORDER BY
    salary_year_avg DESC;