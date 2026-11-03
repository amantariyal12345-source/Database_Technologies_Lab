# Database Technologies Lab Sheet 8
**Course Code:** MCA105P  
**Topics:** Functions and Stored Procedures

## Files
- `00_setup.sql` — creates `Hospital_Functions_Lab` and inserts the supplied Patients and Medicines data.
- `Q1` to `Q10` — each file contains the original practical question and its SQL solution.

## Recommended execution order
1. Run `00_setup.sql` first.
2. Run each question file in MySQL Workbench or another MySQL SQL editor.
3. Run Q1 through Q10 in order. Q9 and Q10 include the functions they need, so they can also be run independently after setup.
4. Record the query output for each question as required by the lab sheet.

## Notes and assumptions
- Q2 age categories are defined as: below 18 = Child, 18–59 = Adult, 60 and above = Senior.
- Q3 demonstrates tax using 18%.
- Q7 increases Paracetamol stock (MedicineID 301) by 10.
- Q9's supplied dataset has no height column. The script adds `HeightM` and inserts sample heights solely to demonstrate BMI. Replace these with actual heights if provided by your faculty.
- Q10 stock status is defined as: 75 or more = High, 40–74 = Medium, below 40 = Low.
- Use only the `Hospital_Functions_Lab` database, as instructed in the lab sheet.
