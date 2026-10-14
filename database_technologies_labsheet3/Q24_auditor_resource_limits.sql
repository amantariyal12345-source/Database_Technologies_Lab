-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q24. [DCL - Account Resource Throttling] Apply query rate limits (100 queries/hour, maximum 2 simultaneous user connections) to 'auditor'@'localhost'.
--
-- Answer (MySQL):
ALTER USER 'auditor'@'localhost'
WITH MAX_QUERIES_PER_HOUR 100
     MAX_USER_CONNECTIONS 2;

-- Review account grants separately with:
SHOW GRANTS FOR 'auditor'@'localhost';
