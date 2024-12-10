/*
Easy Level SQL Practice Queries
This file contains SQL queries for basic-level practice from "sql-practice.com". The queries cover fundamental operations like selecting, updating, joining, and filtering data from tables. Each query has been numbered and properly formatted for clarity.
*/


-- 1. Show all records from the patients table
SELECT * FROM patients;

-- 2. Show first name, last name, and gender of patients whose gender is 'M'
SELECT first_name, last_name, gender 
FROM patients 
WHERE gender = 'M';

-- 3. Show first name and last name of patients who do not have allergies (NULL)
SELECT first_name, last_name 
FROM patients 
WHERE allergies IS NULL;

-- 4. Show first name of patients that start with the letter 'C'
SELECT first_name 
FROM patients 
WHERE first_name LIKE 'C%';

-- 5. Show first name and last name of patients that weigh within the range of 100 to 120 (inclusive)
SELECT first_name, last_name 
FROM patients 
WHERE weight BETWEEN 100 AND 120;

-- 6. Update the patients table for the allergies column. 
-- If the patient's allergies are NULL, then replace it with 'NKA'
UPDATE patients 
SET allergies = 'NKA' 
WHERE allergies IS NULL;

-- 7. Show first name and last name concatenated into one column to show their full name
SELECT CONCAT(first_name, ' ', last_name) AS fullname 
FROM patients;

-- 8. Show first name, last name, and the full province name of each patient. 
-- Example: 'Ontario' instead of 'ON'
SELECT first_name, last_name, province_name
FROM patients
JOIN province_names ON province_names.province_id = patients.province_id;

-- 9. Show how many patients have a birth_date with 2010 as the birth year
SELECT COUNT(birth_date) 
FROM patients 
WHERE YEAR(birth_date) = 2010;

-- 10. Show the first name, last name, and height of the patient with the greatest height
SELECT first_name, last_name, height 
FROM patients 
WHERE height = (SELECT MAX(height) FROM patients);

-- 11. Show all columns for patients who have one of the following patient_ids: 1, 45, 534, 879, 1000
SELECT * 
FROM patients 
WHERE patient_id IN (1, 45, 534, 879, 1000);

-- 12. Show the total number of admissions
SELECT COUNT(patient_id) 
FROM admissions;

-- 13. Show all the columns from admissions where the patient was admitted and discharged on the same day
SELECT * 
FROM admissions 
WHERE admission_date = discharge_date;

-- 14. Show the patient_id and the total number of admissions for patient_id 579
SELECT patient_id, COUNT(patient_id) 
FROM admissions 
WHERE patient_id = '579';

-- 15. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'
SELECT DISTINCT city 
FROM patients 
WHERE province_id = 'NS';

-- 16. Write a query to find the first name, last name, and birth date of patients who have a height greater than 160 and weight greater than 70
SELECT first_name, last_name, birth_date 
FROM patients 
WHERE height > 160 AND weight > 70;

-- 17. Write a query to find a list of patients' first names, last names, and allergies 
-- where allergies are not NULL and are from the city of 'Hamilton'
SELECT first_name, last_name, allergies 
FROM patients 
WHERE allergies IS NOT NULL AND city = 'Hamilton';
