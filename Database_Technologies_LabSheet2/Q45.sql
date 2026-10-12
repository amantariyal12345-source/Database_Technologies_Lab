-- Database Technologies Lab Sheet 2 | Question 45
-- Question: Raise salary by 10% if below 60000, otherwise by 5%, using CASE.

UPDATE employees SET salary = CASE WHEN salary < 60000 THEN salary * 1.10 ELSE salary * 1.05 END;
