SELECT
j.job_id,
j.job_title,
j.job_location,
j.job_schedule_type,
j.salary_year_avg,
j.job_posted_date,
c.name
FROM
job_postings_fact AS j
LEFT JOIN company_dim as c
ON j.company_id=c.company_id
WHERE
job_title_short='Data Analyst' AND
job_location='Anywhere' AND
salary_year_avg is not null
ORDER BY
salary_year_avg DESC
LIMIT 10