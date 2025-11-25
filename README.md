SEBI Regulatory Database Documentation
📌 1. Introduction

This documentation provides an in-depth overview of the SEBI Regulatory Database System, designed using MySQL. The system models the functioning of a financial market regulator by capturing data related to intermediaries, registrations, complaints, investigations, penalties, departments, employees, datasets, and analytics projects.

The objective of this documentation is to explain:

The overall database design

The structure of the schema

Purpose of each table

Relationships between entities

How to run and use the database

📂 2. Project Structure
database/
│── schema/
│   ├── tables.sql          # Schema (DDL)
│   ├── attributes.sql      # Sample Data (DML)
│   └── eer-diagram.mwb     # MySQL Workbench Model
│
docs/
│── ERD.png                 # Export of the ERD
│── data-dictionary.md      # Field-level explanations
│── database-design.md      # Architecture explanation

🏗️ 3. Database Architecture Overview

The database represents the ecosystem of a regulatory authority. It has 12 major tables grouped into six logical modules:

A. Intermediary Management
Table	Purpose
Intermediary_Type	Categorizes intermediaries (Broker, Mutual Fund, RTA, etc.)
Intermediary	Stores details of registered market participants
Registration	Tracks initial & renewal registrations of intermediaries
B. Investigations & Enforcement
Table	Purpose
Investigation_Case	Logs investigation cases assigned to departments
Penalty_Action	Stores penalties such as fines, warnings, suspensions
C. Investor Services
Table	Purpose
Complaint	Records investor complaints, status, department, and resolution
D. SEBI Internal Organisation
Table	Purpose
SEBI_BoardMember	Chairman / WTM / Board Members
Department	SEBI departments with head board member
RegionalOffice	SEBI’s regional and local offices
Employee	Employees mapped to departments and RO offices
E. Data & Analytics
Table	Purpose
DataSet	Metadata of regulatory datasets
Analytics_Project	Data analytics projects using the datasets
🔗 4. Entity–Relationship Structure

The ERD visually presents:

PK–FK relationships

Cardinality between departments, intermediaries, investigations, datasets, employees, etc.
You can view it here:

📁 docs/ERD.png

To edit the design, use:

📁 database/schema/eer-diagram.mwb
(Open with MySQL Workbench)

🧱 5. How to Run the Database
Step 1 — Create the schema

Run:

SOURCE database/schema/tables.sql;

Step 2 — Populate data

Run:

SOURCE database/schema/attributes.sql;

Step 3 — Verify
SHOW TABLES;

📌 6. Key Design Principles
✔ Normalization

The schema follows 3NF:

No repeating fields

No partial dependencies

Referential integrity ensured

✔ Clear Entity Boundaries

Intermediary, Employee, and Dataset modules are clearly separated.

✔ Strong Referential Links

Examples:

Department.head_board_member_id → SEBI_BoardMember.board_id

Complaint.dept_id → Department.dept_id

Registration.interm_id → Intermediary.interm_id

✔ ENUM Usage for Regulatory Status

Used for:

Intermediary status

Registration type

Case status

Complaint status

Project status

🧪 7. Example Queries
A. Active intermediaries
SELECT name, city, status FROM Intermediary WHERE status = 'Active';

B. Complaints pending resolution
SELECT * FROM Complaint WHERE complaint_status = 'Open';

C. Investigations handled by Enforcement Department
SELECT c.case_id, i.name AS intermediary
FROM Investigation_Case c
JOIN Intermediary i ON c.interm_id = i.interm_id
WHERE dept_id = 1;

D. Total penalties collected
SELECT SUM(amount) AS total_penalty FROM Penalty_Action;

🧾 8. Use Cases of This Database

Academic database project

Simulating a regulatory information system

Dashboards in Tableau / Power BI

Analytics in Python or R

Data engineering practice

Case study modelling for finance domain

💡 9. Future Extensions

If you wish to expand the project, you may add:

Audit trail module

Market surveillance logs

Compliance visits & observations

Registrant financial data

Alerts & rule-based triggers

🏁 10. Conclusion

This SEBI Regulatory Database provides a realistic, well-structured model of regulatory workflows.
The modular schema, sample data, and documentation make it suitable for academic, analytic, or simulation purposes.