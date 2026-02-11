# Write your MySQL query statement below
select eu.unique_id,name
from employees e LEFT JOIN employeeUNI eu on e.id = eu.id