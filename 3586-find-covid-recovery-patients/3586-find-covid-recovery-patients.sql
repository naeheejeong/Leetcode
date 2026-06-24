-- Write your MySQL query statement below

SELECT pa.patient_id, pa.patient_name, pa.age, 
datediff(MIN(n.test_date) , MIN(p.test_date)) recovery_time
FROM covid_tests p
INNER JOIN covid_tests n
    ON p.patient_id = n.patient_id 
        AND p.test_date < n.test_date 
        AND p.result = 'Positive' 
        AND n.result = 'Negative'
INNER JOIN patients pa ON n.patient_id = pa.patient_id
GROUP BY pa.patient_id, pa.patient_name, pa.age
ORDER BY recovery_time, pa.patient_name;