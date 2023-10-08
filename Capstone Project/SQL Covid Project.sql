SELECT * FROM corona.data;
1.Find the number of corona patients who faced shortness of breath.

select count(*)  
from data 
where Shortness_of_breath like '%True%'; 

2.Find the number of negative corona patients who have fever and sore_throat. 

SELECT COUNT(*) AS negative_patients
FROM data
WHERE Corona like '%negative%' AND Fever like '%TRUE%' AND Sore_throat = '%TRUE%';


3.Group the data by month and rank the number of positive cases. 

 SELECT
    MONTH(Test_date) AS month,
    SUM(CASE WHEN Corona = 'positive' THEN 1 ELSE 0 END) AS Positive_Cases
FROM
    data
WHERE
    Test_date IS NOT NULL
GROUP BY
    month;

4.Find the female negative corona patients who faced cough and headache

select * from data
where Corona='positive' and Cough_symptoms='True' and headache='TRUE' and Sex like '%female%'

5.How many elderly corona patients have faced breathing problems?

SELECT COUNT(*) AS Elderly_Patients_With_Breathing_Problems
FROM data
WHERE  Shortness_of_breath like '%TRUE%' AND Age_60_above = '%TRUE%';

6.Which three symptoms were more common among COVID positive patients? 

select Cough_symptoms,COUNT(*) AS Symptom_Count
FROM data
WHERE Corona like '%positive%'
GROUP BY Cough_symptoms
ORDER BY Symptom_Count DESC
LIMIT 3;

7.Which symptom was less common among COVID negative people?

SELECT
    'Cough_symptoms' AS Symptom,
    SUM(CASE WHEN Cough_symptoms = 'TRUE' THEN 1 ELSE 0 END) AS Count
FROM data
WHERE Corona = 'negative'
UNION
SELECT
    'Fever' AS Symptom,
    SUM(CASE WHEN Fever = 'TRUE' THEN 1 ELSE 0 END) AS Count
FROM data
WHERE Corona = 'negative'
UNION
SELECT
    'Shortness_of_breath' AS Symptom,
    SUM(CASE WHEN Shortness_of_breath = 'TRUE' THEN 1 ELSE 0 END) AS Count
FROM data
WHERE Corona = 'negative'
UNION
SELECT
    'Sore_throat' AS Symptom,
    SUM(CASE WHEN Sore_throat = 'TRUE' THEN 1 ELSE 0 END) AS Count
FROM data
WHERE Corona = 'negative'
UNION
SELECT
    'Headache' AS Symptom,
    SUM(CASE WHEN Headache = 'TRUE' THEN 1 ELSE 0 END) AS Count
FROM data
WHERE Corona = 'negative'
ORDER BY Count ASC
LIMIT 1;



