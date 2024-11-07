-- Objetivo da Consulta: Identificar as melhores oportunidades como Analista de Dados no Brasil no ano de 2023 --
-- Query objective: Identify the best job oportunities for an Data Analyst in Brazil at 2023 --

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

