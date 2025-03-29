--What is the demographic profile of the patient population, including age and gender distribution?
   -- 1. Filtering out NULL values in the Patient Table

DELETE from [Healthcare_Database].[dbo].[Patient Table]
WHERE patient_id IS NULL
  AND patient_name IS NULL
  AND date_of_birth IS NULL
  AND gender IS NULL
  AND address IS NULL;



select gender, 
CASE
WHEN DATEDIFF(year, date_of_birth, GETDATE()) BETWEEN 0 AND 17 THEN 'Pediatric'
WHEN DATEDIFF(year, date_of_birth, GETDATE()) BETWEEN 18 AND 64 THEN 'Adult'
ELSE 'Senior'
END AS age_group,
COUNT(*) AS patient_count
from [Healthcare_Database].[dbo].[Patient Table]
group by gender, 
CASE
WHEN DATEDIFF(year, date_of_birth, GETDATE()) BETWEEN 0 AND 17 THEN 'Pediatric'
WHEN DATEDIFF(year, date_of_birth, GETDATE()) BETWEEN 18 AND 64 THEN 'Adult'
ELSE 'Senior'
END



--Which diagnoses are most prevalent among patients, and how do they vary across different demographic groups,including gender and age?--

SELECT gender,
CASE
WHEN DATEDIFF(year, date_of_birth, GETDATE()) BETWEEN 0 AND 17 THEN 'Pediatric'
WHEN DATEDIFF(year, date_of_birth, GETDATE()) BETWEEN 18 AND 64 THEN 'Adult'
ELSE 'Senior'
END AS age_group,
COUNT(*) AS patient_count
FROM [Healthcare_Database].[dbo].[Patient Table] 
GROUP BY
gender,
CASE
WHEN DATEDIFF(year, date_of_birth, GETDATE()) BETWEEN 0 AND 17 THEN 'Pediatric'
WHEN DATEDIFF(year, date_of_birth, GETDATE()) BETWEEN 18 AND 64 THEN 'Adult'
ELSE 'Senior'
END



--Which patients on the "patients" table were hospitalized and for how many days

SELECT
p.patient_id,
Days_in_the_hospital
FROM
[Healthcare_Database].[dbo].[Patient Table] AS p
INNER JOIN [Healthcare_Database].[dbo].[Hospital Records] AS hr
ON p.patient_id = hr.patient_id



--Verify who has a hospital record

SELECT
p.patient_id,
Days_in_the_hospital
FROM [Healthcare_Database].[dbo].[Patient Table] AS p
LEFT JOIN [Healthcare_Database].[dbo].[Hospital Records] AS hr
ON p.patient_id = hr.patient_id
WHERE Days_in_the_hospital IS NULL