/*Question 4: What are the top skills based on salary?

Requirements:

Look at the average salary associated with each skill for Data Analyst positions
Focus on roles with specified salaries, regardless of location
Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve

*/

/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions.
- Focus on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts
    and helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;


/*
PySpark tops the list by a wide margin (~$19K higher than #2). This is a big-data/Spark skill, not a typical "Data Analyst" tool — its presence here confirms the classic pattern in this dataset: a handful of postings mentioning a specialized/big-data skill pull the average way up, because few Data Analyst postings need it, but the ones that do pay a premium (often because the role is really more Data Engineer-adjacent).

Bitbucket and GitLab both appearing high (#2 and #6) is a bit unusual for "Data Analyst" — these are version-control tools typically associated with engineering roles. This is a strong signal that this dataset either (a) has some mislabeled job titles, or (b) reflects analyst roles that overlap heavily with engineering responsibilities.

Couchbase and Watson tying exactly at $160,515 is worth double-checking — an exact tie between two unrelated skills usually means very few postings are behind each average (possibly even just 1 posting each, where both point to the same job or two jobs with identical salaries). This is the classic small-sample-size effect I flagged earlier.
*/