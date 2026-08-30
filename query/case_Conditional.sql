SELECT 
    COUNT(job_id) AS job_count,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location  = 'New York' THEN 'Local'
        ELSE 'Onsite'
    END AS Location_category
FROM
    job_postings_fact
GROUP BY
   location_category;


SELECT * FROM job_postings_fact LIMIT 10;