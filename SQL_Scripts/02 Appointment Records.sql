--Getting the current date and time
SELECT GETDATE() AS today


--Extract the day of the week from the "appointment_date" column in integer
SELECT
appointment_date,
DATEPART(weekday, appointment_date) AS day_of_the_week
FROM [Healthcare_Database].[dbo].Appointments


--Extract the hour from the "appointment_time" column
SELECT
appointment_time,
DATEPART(hour, appointment_time) AS appointment_hour
FROM [Healthcare_Database].[dbo].Appointments



--Extract the day of the week from the "appointment_date" column in character strings
SELECT
appointment_date,
DATENAME(weekday, appointment_date) AS day_of_the_week
FROM [Healthcare_Database].[dbo].Appointments


--Add five days to a date
SELECT
DATEADD(day, 5, '2024-10-01') AS new_date


--Subtract two months from a date
SELECT
DATEADD(month, -2, '2024-10-01') AS new_date


--Retrieve the amount of days between January 1st 2024 and January 10th 2024
SELECT
DATEDIFF(day, '2024-01-01', '2024-01-10') AS date_difference

  
--Retrieve the number of months between January 1st 2023 and May 10th 2024
SELECT
DATEDIFF (month, '2023-01-01', '2024-05-01') AS date_difference
  

--Calculate the difference between the arrival time and appointment time in hours
SELECT
appointment_time,
arrival_time,
DATEDIFF(minute, appointment_time, arrival_time) AS minutes_difference
FROM [Healthcare_Database].[dbo].Appointments


