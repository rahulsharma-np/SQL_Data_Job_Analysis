/*SELECT 
    COUNT(job_id) AS job_count,
    EXTRACT(MONTH FROM job_posted_date) AS Month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    MONTH
ORDER BY
    job_count DESC;*/

    SELECT
        job_schedule_type,
        ROUND(AVG(salary_year_avg), 2) AS avg_yearly_salary,
        ROUND(AVG(salary_hour_avg), 2) AS avg_hourly_salary,
        MIN(job_posted_date) AS earliest_posted_date,
        MAX(job_posted_date) AS latest_posted_date /*we cannot see 
        the job posted date in  SELECT as it will through an error
         , only the group by column in SELECT statement*/

        /*Memory hook: "Grouped column → naked in SELECT.
         Everything else → wrapped in an aggregate." */
    FROM
        job_postings_fact
    WHERE
        job_posted_date > '2023-06-01'
    GROUP BY
        job_schedule_type;