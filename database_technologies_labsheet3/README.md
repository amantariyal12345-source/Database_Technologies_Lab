# Database Technologies Lab Sheet 3 — MCA105P

This repository contains one `.sql` file per question for Q01–Q30 from the uploaded lab sheet. Each file includes the question and a MySQL answer.

## Files
- `Q01_...sql` through `Q30_...sql`: one question and solution per file.
- The scripts are intended for MySQL 8.x unless noted.

## How to use
1. Open MySQL Workbench or a MySQL command-line client.
2. Use the relevant database and account before running a script.
3. Run each file separately and verify the result.
4. For account-management questions, use an administrator account where required.

## Important notes
- The provided PDF contains questions Q01–Q30; the title mentions 50 practice problems, but Q31–Q50 are not present in the uploaded pages.
- Some tasks need privileges beyond the sample accounts' grants. In particular, Q25 updates both `orders` and `departments`, but the worksheet's `manager` account is only granted privileges on `orders`; the required department privilege must be granted separately by an administrator.
- Q19, Q25, and Q29 describe conditional workflows. SQL clients/applications should check affected-row counts or business conditions and choose `COMMIT` or `ROLLBACK` accordingly. Comments in the scripts explain these points.
- Replace example passwords before using these accounts outside a lab. Do not commit real passwords to a public GitHub repository.
- `FLUSH PRIVILEGES` is generally unnecessary after using `GRANT`, `REVOKE`, `CREATE USER`, or `ALTER USER`; it is included because Q09 specifically asks for it.
