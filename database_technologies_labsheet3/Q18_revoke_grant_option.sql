-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q18. [DCL - Revoking Delegation Rights] Revoke GRANT OPTION from 'team_lead'@'localhost' without revoking base permissions.
--
-- Answer (MySQL):
REVOKE GRANT OPTION ON company_db.* FROM 'team_lead'@'localhost';

-- The SELECT and INSERT privileges remain in place.
