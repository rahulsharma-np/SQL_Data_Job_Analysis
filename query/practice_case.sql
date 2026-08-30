SELECT 
    salary_year_avg,
    CASE 
        WHEN salary_year_avg IS NULL THEN 'Not Listed'
        WHEN salary_year_avg < 50000 THEN 'Low'
        WHEN salary_year_avg BETWEEN 50000 AND 100000 THEN 'Standard'
        ELSE 'High'
    END AS salary_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC;