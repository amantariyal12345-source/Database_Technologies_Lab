# Database Technologies Lab Sheet 6 — Stored Procedures & Functions

## Files
- `00_database_setup.sql`: Creates `CollegeDB`, its tables, and the sample data from the lab sheet.
- `Q01_...sql` through `Q20_...sql`: One separate SQL file per question. Each file contains the question and its MySQL code.

## How to run
1. Open MySQL Workbench or another MySQL client.
2. Run `00_database_setup.sql` first.
3. Run each question file in MySQL.
4. Stored procedures are tested with `CALL procedure_name(...)`.
5. Functions are tested with `SELECT function_name(...)`.

## Notes
- The lab sheet uses MySQL-style stored procedures and functions.
- Creating functions may require permission to create routines, depending on your MySQL server configuration.
- Run Q14 before Q20, because Q20 uses the `StudentGrade()` function created in Q14.
- The setup uses `CREATE TABLE IF NOT EXISTS` and `INSERT IGNORE` so rerunning it does not duplicate the provided primary-key records.
