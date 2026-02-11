# Write your MySQL query statement below
-- DIAB1
select patient_id, patient_name, conditions
from patients
where conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%'