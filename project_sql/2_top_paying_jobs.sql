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
        job_location = 'Remote' AND
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
    salary_year_avg DESC;