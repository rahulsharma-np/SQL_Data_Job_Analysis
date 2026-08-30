SELECT * FROM (
    --subquery starts here
    SELECT * FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2
    /*end here*/        ) 
    AS february_jobs;

WITH january_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1 --for january
)

SELECT * FROM january_jobs;

SELECT 
    name AS Company_Name,
    company_id AS Company_ID
FROM 
    company_dim
WHERE company_id IN(
    SELECT 
        company_id,
        job_id
    FROM
        job_postings_fact   
    WHERE 
        job_no_degree_mention = TRUE
    ORDER BY company_id
    )
ORDER BY company_id ASC;


SELECT * FROM company_dim;


/*
find the companies that have the most job openings
-Get the total number of job_postings per company_id (job_postings_fact)
-Return the total number of jobs with the company name (company_dim)
*/

WITH company_job_counts AS (
    SELECT 
        company_id,
        COUNT(*) AS total_jobs
    FROM 
        job_postings_fact
    GROUP BY
        company_id
)

SELECT company_dim.name AS company_name, 
       company_job_counts.total_jobs
FROM 
    company_dim
LEFT JOIN 
    company_job_counts 
ON
     company_dim.company_id = company_job_counts.company_id
ORDER BY
     company_job_counts.total_jobs DESC;



SELECT
    sd.skill_id,
    sd.skills AS skill_name,
    COUNT(*) AS demand_count
FROM
    job_postings_fact jp
JOIN
    skills_job_dim sj ON jp.job_id = sj.job_id
JOIN
    skills_dim sd ON sj.skill_id = sd.skill_id
WHERE
    jp.job_work_from_home = TRUE
GROUP BY
    sd.skill_id, sd.skills
ORDER BY
    demand_count DESC
LIMIT 5;

--top 5 skills most frequently mentioned (job_postings_fact)
--using subqueries
--find the skill id --- having highest counts(skills-job_dim)
--- join the result (skills_dim_table)

SELECT
    sd.skill_id,
    sd.skills AS skill_name,
    skills_count.skills_count
FROM 
    (
        SELECT 
            skill_id,
            COUNT(*) AS skills_count
        FROM 
            skills_job_dim
        GROUP BY 
            skill_id
    ) AS skills_count
JOIN 
    skills_dim sd ON skills_count.skill_id = sd.skill_id
ORDER BY 
    skills_count.skills_count DESC
LIMIT 5;

/*
Question : 
For each company, count their total job postings,
 then label them 'Small' (<10 postings),
  'Medium' (10–50), or 'Large' (>50).
   The counting must happen in a subquery first,
    before you classify.
*/

SELECT* FROM job_postings_fact LIMIT 5;

SELECT
    company_id,
     job_count,
    CASE
        WHEN job_count < 10 THEN 'Small'
        WHEN job_count BETWEEN 10 AND 50 THEN 'Medium'
        WHEN job_count > 50 THEN 'Large'
    END AS Company_Size
FROM
    (
        SELECT 
            company_id,
            COUNT(*) AS job_count
        FROM
            job_postings_fact
        GROUP BY 
            company_id
    ) AS company_job_counts
    


