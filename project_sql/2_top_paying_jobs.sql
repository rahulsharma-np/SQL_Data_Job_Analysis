/*
Qn 1 doesn't make satisfaction, actually which skills 
are making the salary of data analyst much more higher


Question 2:

Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
  helping job seekers understand which skills to develop that align with top salaries
*/
 
WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM 
        job_postings_fact_research AS jr
    LEFT JOIN
        company_dim ON jr.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
    tpj.*
FROM    
    top_paying_jobs AS tpj
INNER JOIN 
    skills_job_dim AS sjd ON tpj.job_id = sjd.job_id
INNER JOIN 
    skills_dim AS sd ON sjd.skill_id = sd.skill_id
ORDER BY
    salary_year_avg DESC
LIMIT 10;