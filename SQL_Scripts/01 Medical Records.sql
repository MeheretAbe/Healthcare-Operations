--Find out how many days on average the patients spent in the Cardiology department of the hospital

SELECT AVG(days_in_the_hospital) AS average_days_cardiology
FROM [Healthcare_Database].[dbo].[Hospital Records]
WHERE department_name = 'Cardiology'

  
--Compare the average number of days the patients are spending in each department of the hospital

SELECT
department_name,
AVG(days_in_the_hospital) AS avg_days_per_department
FROM [Healthcare_Database].[dbo].[Hospital Records]
GROUP BY department_name
ORDER BY avg_days_per_department DESC 



--Categorize patients based on their length of stay in the hospital

SELECT
patient_id,
days_in_the_hospital,
CASE
WHEN days_in_the_hospital <=3 THEN 'Short'
WHEN days_in_the_hospital <= 5 THEN 'Medium'
ELSE 'Long'
END AS stay_category
FROM [Healthcare_Database].[dbo].[Hospital Records]



--Count the number of patients in each category created

SELECT
CASE
WHEN days_in_the_hospital <=3 THEN 'Short'
WHEN days_in_the_hospital <= 5 THEN 'Medium'
ELSE 'Long'
END AS stay_category,
COUNT(*) AS number_of_records
FROM [Healthcare_Database].[dbo].[Hospital Records]
GROUP BY
CASE
WHEN days_in_the_hospital <=3 THEN 'Short'
WHEN days_in_the_hospital <= 5 THEN 'Medium'
ELSE 'Long'
END
