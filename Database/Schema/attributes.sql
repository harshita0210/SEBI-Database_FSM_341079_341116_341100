USE sebi_regdb;
INSERT INTO Intermediary_Type (type_name) VALUES
  ('Broker'),
  ('Mutual Fund'),
  ('Portfolio Manager'),
  ('Investment Advisor'),
  ('Depository Participant'),
  ('Sub-Broker'),
  ('Registrar & Transfer Agent'),
  ('Underwriter'),
  ('Credit Rating Agency'),
  ('Venture Capital Fund');
  
  INSERT INTO SEBI_BoardMember (name, position, appointed_date, email) VALUES
  ('Tuhin Kanta Pandey', 'Chairman', '2023-03-01', 'tuhin.pandey@sebi.gov.in'),
  ('Madhabi Puri Buch', 'Whole Time Member', '2022-04-01', 'madhabi.buch@sebi.gov.in'),
  ('Ananta Barua', 'Whole Time Member', '2018-08-01', 'ananta.barua@sebi.gov.in'),
  ('S K Mohanty', 'Whole Time Member', '2018-08-01', 'sk.mohanty@sebi.gov.in'),
  ('Board Member X', 'Board Member', '2023-01-10', 'bm.x@sebi.gov.in'),
  ('Board Member Y', 'Board Member', '2023-02-15', 'bm.y@sebi.gov.in'),
  ('Board Member Z', 'Board Member', '2024-06-20', 'bm.z@sebi.gov.in'),
  ('Board Member A', 'Board Member', '2024-11-10', 'bm.a@sebi.gov.in'),
  ('Board Member B', 'Board Member', '2025-01-05', 'bm.b@sebi.gov.in'),
  ('Board Member C', 'Board Member', '2025-02-10', 'bm.c@sebi.gov.in');
  
  INSERT INTO RegionalOffice (name, city, contact_number) VALUES
  ('Northern Regional Office', 'New Delhi', '011-69012960'),
  ('Southern Regional Office', 'Chennai', '044-28880141'),
  ('Eastern Regional Office', 'Kolkata', '033-23023053'),
  ('Western Regional Office I', 'Mumbai', '022-26449000'),
  ('Western Regional Office II', 'Ahmedabad', '079-27467033'),
  ('Central Regional Office', 'Bengaluru', '080-22220000'),
  ('North Eastern Office', 'Guwahati', '0361-2500000'),
  ('Western Regional Office III', 'Pune', '020-26000000'),
  ('Southern Office II', 'Hyderabad', '040-23000000'),
  ('Eastern Office II', 'Patna', '0612-2300000');
  
  INSERT INTO Department (name, type, head_board_member_id) VALUES
  ('Enforcement Department', 'Enforcement', 2),
  ('Market Regulation Department', 'Regulation', 4),
  ('Investment Management Department', 'Investment', 3),
  ('Legal Affairs Department', 'Legal', 1),
  ('Information Technology Department', 'IT', 2),
  ('Human Resources Department', 'HR', 3),
  ('Economic & Policy Analysis Department', 'Policy', 5),
  ('Investor Education Department', 'Education', 6),
  ('General Services Department', 'Administrative', 7),
  ('Adjudication Department', 'Quasi-Judicial', 8);
  
  INSERT INTO Employee (name, designation, dept_id, ro_id, email, date_of_joining, phone) VALUES
  ('Alice Sharma', 'Director - Enforcement', 1, 1, 'alice.sharma@sebi.gov.in', '2018-06-01', '01112345678'),
  ('Ravi Kumar', 'Manager - Market Reg', 2, 2, 'ravi.kumar@sebi.gov.in', '2019-07-15', '04423456789'),
  ('Priya Singh', 'Analyst – Investment', 3, 3, 'priya.singh@sebi.gov.in', '2020-01-20', '03334567890'),
  ('Karan Mehta', 'Legal Counsel', 4, 1, 'karan.mehta@sebi.gov.in', '2017-09-10', '01187654321'),
  ('Deepa Verma', 'IT Specialist', 5, 4, 'deepa.verma@sebi.gov.in', '2021-03-05', '02234567890'),
  ('Manish Rao', 'HR Officer', 6, 2, 'manish.rao@sebi.gov.in', '2018-11-23', '04445678901'),
  ('Suresh Iyer', 'Policy Analyst', 7, 5, 'suresh.iyer@sebi.gov.in', '2022-02-11', '07956789012'),
  ('Neha Patel', 'Investor Educator', 8, 1, 'neha.patel@sebi.gov.in', '2019-05-17', '01123456712'),
  ('Vikram Gupta', 'Adjudication Officer', 10, 2, 'vikram.gupta@sebi.gov.in', '2020-08-27', '04487654320'),
  ('Sunita Joshi', 'Surveillance Executive', 2, 3, 'sunita.joshi@sebi.gov.in', '2021-10-01', '03376543210');
  
  INSERT INTO Intermediary (name, type_id, registration_date, status, assets_under_mgmt, city) VALUES
  ('XYZ Brokers Pvt Ltd', 1, '2019-03-15', 'Active', 500000000.00, 'Mumbai'),
  ('Alpha Mutual Fund', 2, '2018-07-01', 'Active', 1200000000.00, 'New Delhi'),
  ('Beta Portfolio Managers', 3, '2020-05-20', 'Active', 750000000.00, 'Bengaluru'),
  ('Gamma Securities Ltd', 1, '2021-01-10', 'Suspended', 300000000.00, 'Kolkata'),
  ('Delta Advisors Pvt Ltd', 4, '2017-11-25', 'Active', 250000000.00, 'Chennai'),
  ('Epsilon Funds', 2, '2019-12-05', 'Active', 600000000.00, 'Ahmedabad'),
  ('Zeta Brokers', 1, '2022-06-30', 'Active', 350000000.00, 'Pune'),
  ('Eta Capital Mgmt', 3, '2018-02-14', 'Active', 950000000.00, 'New Delhi'),
  ('Theta Securities Ltd', 1, '2022-08-01', 'Pending', 200000000.00, 'Hyderabad'),
  ('Iota Wealth Advisors', 4, '2020-09-10', 'Active', 400000000.00, 'Bengaluru');
  
  INSERT INTO Registration (interm_id, reg_type, reg_date, expiry_date) VALUES
  (1, 'Initial', '2019-03-15', '2022-03-14'),
  (2, 'Initial', '2018-07-01', '2021-06-30'),
  (2, 'Renewal', '2021-07-01', '2024-06-30'),
  (3, 'Initial', '2020-05-20', '2023-05-19'),
  (4, 'Initial', '2021-01-10', '2024-01-09'),
  (5, 'Initial', '2017-11-25', '2020-11-24'),
  (6, 'Initial', '2019-12-05', '2022-12-04'),
  (7, 'Initial', '2022-06-30', '2025-06-29'),
  (8, 'Initial', '2018-02-14', '2021-02-13'),
  (9, 'Initial', '2022-08-01', '2025-07-31');
  
  INSERT INTO Investigation_Case (interm_id, dept_id, case_status, start_date, close_date, description) VALUES
  (1, 1, 'Open', '2023-01-10', NULL, 'Alleged insider trading'),
  (2, 1, 'Closed', '2021-03-12', '2021-12-01', 'NAV mis-reporting by mutual fund'),
  (3, 2, 'Open', '2022-07-05', NULL, 'Market manipulation suspected'),
  (4, 1, 'Closed', '2022-11-01', '2023-04-20', 'Brokers violating trade rules'),
  (5, 4, 'Open', '2021-08-17', NULL, 'Advisor non-disclosure risk to clients'),
  (6, 1, 'Closed', '2020-05-25', '2021-05-25', 'Non-compliance with registration regulation'),
  (7, 3, 'Open', '2023-02-01', NULL, 'Portfolio manager not reporting holdings'),
  (8, 1, 'Closed', '2022-09-09', '2023-01-15', 'Surveillance breach – trade anomaly'),
  (9, 5, 'Open', '2023-07-01', NULL, 'Advisor overcharging fees'),
  (10, 1, 'Closed', '2020-12-30', '2021-06-30', 'Audit failure by broker');
  
  INSERT INTO Penalty_Action (case_id, action_type, amount, action_date) VALUES
  (2, 'Fine', 500000.00, '2021-12-02'),
  (4, 'Suspension', 0.00, '2023-04-21'),
  (6, 'Fine', 750000.00, '2021-05-26'),
  (8, 'Fine', 300000.00, '2023-01-16'),
  (10, 'Warning', 0.00, '2021-07-01'),
  (5, 'Monitoring', 0.00, '2021-09-01'),
  (3, 'Investigation Ongoing', 0.00, '2022-07-05'),
  (1, 'Investigation Ongoing', 0.00, '2023-01-10'),
  (7, 'Investigation Ongoing', 0.00, '2023-02-01'),
  (9, 'Investigation Ongoing', 0.00, '2023-07-01');

INSERT INTO Complaint (investor_name, interm_id, dept_id, complaint_type, filed_date, resolved_date, complaint_status, comments) VALUES
  ('Vikas Gupta', 1, 1, 'Trade Delay', '2023-01-15', NULL, 'Open', 'Trades not executed quickly'),
  ('Anita Desai', 2, 8, 'NAV Discrepancy', '2022-05-20', '2022-09-10', 'Resolved', 'NAV calculation issue'),
  ('Rohit Verma', 3, 2, 'Manipulation', '2023-03-12', NULL, 'Open', 'Suspected market manipulation'),
  ('Neha Jain', 4, 4, 'Advice Issue', '2021-11-01', '2022-01-20', 'Resolved', 'Adviser misled on risk'),
  ('Siddharth Roy', 5, 1, 'Withdrawal Delay', '2022-07-07', '2022-12-01', 'Resolved', 'Redemption not processed'),
  ('Priya Kapoor', 6, 8, 'High Fees', '2023-02-18', NULL, 'Open', 'Fees seem unfair'),
  ('Aman Singh', 7, 2, 'Poor Returns', '2021-06-30', '2022-02-14', 'Resolved', 'Performance below benchmark'),
  ('Deepika Malhotra', 8, 9, 'Account Access', '2023-04-05', NULL, 'Open', 'Issue logging into account'),
  ('Kunal Mehra', 9, 2, 'Transparency', '2022-10-10', '2023-01-15', 'Resolved', 'Holdings not disclosed'),
  ('Sonalika Bose', 10, 1, 'Registration Delay', '2023-05-25', NULL, 'Open', 'Registration process slow');
  
  INSERT INTO DataSet (name, description, size_gb, format, created_date, owner_dept_id) VALUES
  ('Intermediary_Registrations', 'Dataset of intermediary registration records', 50.00, 'CSV', '2021-01-01', 4),
  ('Complaints_Archive', 'Historic investor complaint logs', 30.00, 'Parquet', '2022-02-15', 8),
  ('Investigation_Cases', 'SEBI investigation case data', 20.00, 'SQL', '2022-06-10', 1),
  ('Employee_Records', 'SEBI employees data', 10.00, 'SQL', '2021-05-20', 6),
  ('Surveillance_Logs', 'Market surveillance logs', 200.00, 'Parquet', '2023-03-14', 2),
  ('Project_Metadata', 'Metadata about analytics projects', 5.00, 'CSV', '2023-01-01', 1),
  ('Intermediary_Performance', 'Performance metrics for intermediaries', 80.00, 'CSV', '2023-04-01', 2),
  ('Policy_Review_Reports', 'Policy report analytics data', 40.00, 'PDF', '2022-10-05', 7),
  ('Investor_Education_Content', 'Educational materials for investors', 2.00, 'PDF', '2021-09-01', 8),
  ('Legal_Adjudication', 'SEBI legal / adjudication case data', 60.00, 'SQL', '2022-12-10', 4);
  
  INSERT INTO Analytics_Project (name, dataset_id, lead_emp_id, start_date, end_date, status, budget_million, description) VALUES
  ('Broker Risk Analysis', 1, 1, '2022-01-01', '2022-06-30', 'Completed', 5.00, 'Risk profiling of broker firms'),
  ('Complaint Trend Analysis', 2, 9, '2023-02-01', NULL, 'Ongoing', 3.50, 'Analyzing trends in investor complaints'),
  ('Case Duration Study', 3, 4, '2022-07-01', '2022-12-31', 'Completed', 2.00, 'Time taken to close investigation cases'),
  ('Employee Turnover Analysis', 4, 6, '2021-06-01', '2021-12-01', 'Completed', 1.50, 'Attrition analysis of SEBI workforce'),
  ('Surveillance Efficiency', 5, 5, '2023-03-15', NULL, 'Ongoing', 4.00, 'Measure effectiveness of market surveillance pipeline'),
  ('Metadata Audit', 6, 2, '2023-01-05', '2023-03-31', 'Completed', 0.80, 'Audit metadata for analytics projects'),
  ('Performance Dashboard', 7, 3, '2023-04-01', NULL, 'Ongoing', 6.00, 'Dashboard for intermediaries’ performance'),
  ('Policy Insight Reports', 8, 7, '2022-10-10', '2023-01-20', 'Completed', 1.20, 'Insights from policy review reports'),
  ('Investor Education Impact', 9, 9, '2021-09-15', '2022-02-28', 'Completed', 0.90, 'Effectiveness of education material'),
  ('Legal Outcome Analytics', 10, 4, '2023-01-10', NULL, 'Ongoing', 2.50, 'Analytics on legal / adjudication cases');
  
  