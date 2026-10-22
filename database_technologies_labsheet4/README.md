# Database Technologies Lab Sheet 4 — MCA105P

**Topic in the supplied PDF:** DDL commands, constraints, indexes, and table setup.

This repository contains separate SQL files for the tasks listed in the uploaded Lab Sheet 4 PDF. Scripts are written for **MySQL 8.x** unless noted otherwise.

## Files
- `01_schooldb_create_database.sql` through `11_rename_email_column.sql`: SchoolDB DDL tasks.
- `12_create_library_tables.sql`: Books, Members, and Loans tables.
- `13_not_null_department_and_student_test.sql` through `26_enrollment_sample_and_composite_index.sql`: constraints and indexes.
- `28_insert_lab_sheet_sample_data.sql`: sample rows provided in the PDF.
- `29_verify_tables_and_data.sql`: verification queries.

## How to run
1. Open MySQL Workbench or the MySQL command-line client.
2. Run the numbered scripts in order where dependencies apply.
3. Some scripts intentionally demonstrate invalid inserts or duplicate values. The test statements are commented out; uncomment them when you want to observe the expected constraint error.
4. `28_insert_lab_sheet_sample_data.sql` expects the `Department`, `Student`, `Course`, and `Enrollment` tables to exist. Create the tables first using the relevant scripts.
5. `TRUNCATE`, `DROP`, and test inserts modify data. Use a practice database, not a production database.

## Important notes
- The PDF uses both `Students` and `Student`; these are treated as separate tasks because they appear in different sections.
- The PDF asks for a foreign key from `Student(DeptID)` to `Department(DeptID)`, and from `Enrollment(StudentID)` to `Student(StudentID)`.
- MySQL cannot add a primary key or unique constraint if existing data violates it.
- A `CHECK` constraint is enforced in modern MySQL versions (8.0.16+).
- Renaming a column in MySQL uses `ALTER TABLE ... RENAME COLUMN ... TO ...` (MySQL 8.0+).
