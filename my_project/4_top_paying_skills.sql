--the question: What are top skills based on salary?
SELECT
avg(j.salary_year_avg)as skill_avg_salary,
sk.skills,
s.skill_id
FROM
job_postings_fact AS j
INNER JOIN skills_job_dim as s ON j.job_id=s.job_id
INNER JOIN skills_dim as sk on s.skill_id=sk.skill_id

WHERE
job_title_short='Data Analyst' and salary_year_avg is not NULL
AND job_country='Germany'
group BY
sk.skills,
s.skill_id

ORDER BY
skill_avg_salary DESC
LIMIT 25;
