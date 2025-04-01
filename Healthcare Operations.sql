--What is the demographic profile of the patient population, including age and gender distribution?
  

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



/*Which diagnoses are most prevalent among patients, and how do they vary across different demographic groups,
including gender and age?*/

SELECT
gender, o.diagnosis,
CASE
WHEN DATEDIFF(year, date_of_birth, GETDATE()) BETWEEN 0 AND 17 THEN 'Pediatric'
WHEN DATEDIFF(year, date_of_birth, GETDATE()) BETWEEN 18 AND 64 THEN 'Adult'
ELSE 'Senior'
END AS age_group,
count(*) as patient_count
FROM [Healthcare_Database].[dbo].[Patient Table] as P
join [Healthcare_Database].[dbo].[Outpatient Visits] as O
on P.patient_id=O.patient_id
GROUP BY
gender, diagnosis,
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



/*What are the most common appointment times throughout the day, and how does the distribution of apppointment
times vary across different hours?*/

SELECT
DATEpart(HOUR, appointment_time) as appointment_hour,
count(*) as appointment_count
FROM [Healthcare_Database].[dbo].Appointment
group by 
DATEpart(HOUR , appointment_time)
order by DATEpart(HOUR, appointment_time)desc

  

/*What are the most most busiest days of the week with the most appointment?*/

SELECT
DATENAME(weekday, appointment_date) AS day_of_the_week,
count(*) as appointment_count
FROM [Healthcare_Database].[dbo].Appointment
group by 
DATENAME(weekday, appointment_date)
order by appointment_count desc



/* Find out information about the patients who had multiple visits within 30 days of their previous medical
visit

- Identify those patients
- Date of initial visit
- Reason of the initial visit
- Readmission date
- Reason for readmission
- Number of days between the initial visit and readmission
- Readmission visit recorded must have happened after the initial visit */


Select 
o_initial.patient_id,
o_initial.visit_date as initial_visit_date,
o_initial.reason_for_visit as reason_for_initial_visit,
o_readmit.visit_date as readmission_date,
o_readmit.reason_for_visit as reason_for_readmission,
DATEDIFF(day,o_initial.visit_date,o_readmit.visit_date) as days_between_initial_and_readmission

from [Healthcare_Database].dbo.[outpatient visits] as o_initial
join [Healthcare_Database].dbo.[outpatient visits] as o_readmit
on o_initial.patient_id= o_readmit.patient_id

where DATEDIFF(day,o_initial.visit_date,o_readmit.visit_date) <=30
and o_readmit.visit_date>o_initial.visit_date




--Compare the select avg(Days_in_the_hospital) as avg_date_in_the_hospital

select department_name, avg(Days_in_the_hospital) as avg_date_per_department
FROM [Healthcare_Database].[dbo].[Hospital Records]
group by department_name
order by avg_date_per_department desc



/*Which diagnoses are most prevalent among patients, and how do they vary across different demographic groups,
including gender and age?*/

SELECT
gender,
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



