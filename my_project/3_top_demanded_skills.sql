SELECT
count(j.job_id)as skill_demand_count,
sk.skills,
s.skill_id
FROM
job_postings_fact AS j
INNER JOIN skills_job_dim as s ON j.job_id=s.job_id
INNER JOIN skills_dim as sk on s.skill_id=sk.skill_id

WHERE
job_title='Data Analyst'
group BY
sk.skills,
s.skill_id

ORDER BY
skill_demand_count DESC
limit 10;

SELECT
count(j.job_id)as skill_demand_count,
sk.skills
FROM
job_postings_fact AS j
INNER JOIN skills_job_dim as s ON j.job_id=s.job_id
INNER JOIN skills_dim as sk on s.skill_id=sk.skill_id

WHERE
job_title='Data Analyst'and job_location='Anywhere'
group BY
sk.skills


ORDER BY
skill_demand_count DESC,
j.job_country asc
limit 10;
