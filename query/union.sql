-- SELECT 
--     company_id,
--     job_location,
--     job_title_short
-- FROM
--     february_jobs

-- UNION ALL

-- SELECT 
--     company_id,
--     job_location,
--     job_title_short
-- FROM
--     january_jobs

SELECT company_id, job_location, job_title_short
FROM (
    SELECT * FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2
) AS february_jobs

UNION

SELECT company_id, job_location, job_title_short
FROM (
    SELECT * FROM job_postings_fact LIMIT 5;
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;



--qn
SELECT
    job_title_short,
    company_id,
    job_location,
    salary_year_avg
FROM (
    SELECT * FROM january_jobs
    UNION ALL
    SELECT * FROM february_jobs
    UNION ALL
    SELECT * FROM march_jobs
) AS q1_jobs
WHERE
    salary_year_avg > 70000;
 