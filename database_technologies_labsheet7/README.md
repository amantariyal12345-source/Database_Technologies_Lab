# Database Technologies Lab Sheet 7 — Cursors and Triggers

**Course Code:** MCA105P  
**Database:** `Hospital_Cursor_Trigger_Lab`  
**DBMS:** MySQL / MySQL-compatible server

## Contents
- `setup.sql`: creates the database, tables, and six sample doctors from the lab sheet.
- `C01_...sql` to `C10_...sql`: cursor questions, each in a separate file.
- `T01_...sql` to `T10_...sql`: trigger questions, each in a separate file.

## How to run
1. Open MySQL Workbench, MySQL Command Line Client, or another MySQL-compatible SQL editor.
2. Run `setup.sql` first.
3. Run each question file separately. The scripts select `Hospital_Cursor_Trigger_Lab` where needed.
4. MySQL clients that support `DELIMITER` can run each file directly. If your SQL editor does not support `DELIMITER`, execute the stored procedure/trigger definition using its routine editor or client-specific script mode.
5. Check the results using the `SELECT` statements included in the files.

## Important notes
- Cursor questions use stored procedures and are written for MySQL.
- Some questions update or delete rows. Run them on this lab database, not on production data.
- `C06`, `C07`, and `C10` change doctor records. Re-run `setup.sql` if you want to restore the original sample dataset.
- Trigger questions use distinct trigger names. Run each trigger file separately and test it with the statement provided.
- The lab sheet's `Doctor_Audit` table records doctor ID, action type, old fee, and new fee. For department-change auditing, the action is recorded in `ActionType`; the table does not have old/new department columns.
- Trigger `SIGNAL` tests intentionally show an error for invalid data; that is expected.
