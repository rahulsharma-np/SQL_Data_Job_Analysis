/*SELECT
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') 
    AS month,
    COUNT(*) AS job_count
FROM
    job_postings_fact
WHERE
    EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') = 2023
GROUP BY
    month 
ORDER BY
    month; */

SELECT DISTINCT
    c.name AS company_name
FROM
    job_postings_fact j
JOIN
    company_dim c ON j.company_id = c.company_id
WHERE
    j.job_health_insurance = TRUE
    AND EXTRACT(QUARTER FROM j.job_posted_date) = 2
    AND EXTRACT(YEAR FROM j.job_posted_date) = 2023;
