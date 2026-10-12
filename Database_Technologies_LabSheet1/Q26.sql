-- Database Technologies Lab Sheet 1 | Question 26
-- Question: Change user_profiles.bio from TEXT to MEDIUMTEXT.

ALTER TABLE user_profiles
MODIFY COLUMN bio MEDIUMTEXT;
