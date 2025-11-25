CREATE DATABASE IF NOT EXISTS sebi_regdb;
USE sebi_regdb;
CREATE TABLE Intermediary_Type (
  type_id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  type_name VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;
CREATE TABLE SEBI_BoardMember (
  board_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  position VARCHAR(100),        -- e.g. Chairman, Whole Time Member
  appointed_date DATE,
  email VARCHAR(100)
) ENGINE=InnoDB;
CREATE TABLE RegionalOffice (
  ro_id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  city VARCHAR(100) NOT NULL,
  contact_number VARCHAR(20)
) ENGINE=InnoDB;
CREATE TABLE Department (
  dept_id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  type VARCHAR(50),  -- Enforcement, Legal, IT etc.
  head_board_member_id INT UNSIGNED,
  FOREIGN KEY (head_board_member_id) REFERENCES SEBI_BoardMember(board_id)
) ENGINE=InnoDB;
CREATE TABLE Employee (
  emp_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  designation VARCHAR(100),
  dept_id SMALLINT UNSIGNED,
  ro_id SMALLINT UNSIGNED,
  email VARCHAR(100) UNIQUE,
  date_of_joining DATE,
  phone VARCHAR(15),
  FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
  FOREIGN KEY (ro_id) REFERENCES RegionalOffice(ro_id)
) ENGINE=InnoDB;
CREATE TABLE Intermediary (
  interm_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(150) NOT NULL,
  type_id SMALLINT UNSIGNED,
  registration_date DATE,
  status ENUM('Active','Suspended','Pending','Deregistered') NOT NULL,
  assets_under_mgmt DECIMAL(18,2),
  city VARCHAR(100),
  FOREIGN KEY (type_id) REFERENCES Intermediary_Type(type_id)
) ENGINE=InnoDB;
CREATE TABLE Registration (
  reg_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  interm_id INT UNSIGNED NOT NULL,
  reg_type ENUM('Initial', 'Renewal') NOT NULL,
  reg_date DATE NOT NULL,
  expiry_date DATE,
  FOREIGN KEY (interm_id) REFERENCES Intermediary(interm_id)
) ENGINE=InnoDB;
CREATE TABLE Investigation_Case (
  case_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  interm_id INT UNSIGNED NOT NULL,
  dept_id SMALLINT UNSIGNED NOT NULL,
  case_status ENUM('Open','Closed') NOT NULL,
  start_date DATE,
  close_date DATE,
  description TEXT,
  FOREIGN KEY (interm_id) REFERENCES Intermediary(interm_id),
  FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
) ENGINE=InnoDB;
CREATE TABLE Penalty_Action (
  action_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  case_id INT UNSIGNED NOT NULL,
  action_type VARCHAR(100),     -- e.g. "Fine", "Suspension"
  amount DECIMAL(18,2),
  action_date DATE,
  FOREIGN KEY (case_id) REFERENCES Investigation_Case(case_id)
) ENGINE=InnoDB;
CREATE TABLE Complaint (
  complaint_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  investor_name VARCHAR(100),
  interm_id INT UNSIGNED,
  dept_id SMALLINT UNSIGNED,
  complaint_type VARCHAR(100),
  filed_date DATE,
  resolved_date DATE,
  complaint_status ENUM('Open','Resolved','Rejected'),
  comments TEXT,
  FOREIGN KEY (interm_id) REFERENCES Intermediary(interm_id),
  FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
) ENGINE=InnoDB;
CREATE TABLE DataSet (
  dataset_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(150) NOT NULL,
  description TEXT,
  size_gb DECIMAL(10,2),
  format VARCHAR(50),   -- e.g. CSV, Parquet, SQL
  created_date DATE,
  owner_dept_id SMALLINT UNSIGNED,
  FOREIGN KEY (owner_dept_id) REFERENCES Department(dept_id)
) ENGINE=InnoDB;
CREATE TABLE Analytics_Project (
  project_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(150) NOT NULL,
  dataset_id INT UNSIGNED NOT NULL,
  lead_emp_id INT UNSIGNED,
  start_date DATE,
  end_date DATE,
  status ENUM('Planned','Ongoing','Completed'),
  budget_million DECIMAL(10,2),
  description TEXT,
  FOREIGN KEY (dataset_id) REFERENCES DataSet(dataset_id),
  FOREIGN KEY (lead_emp_id) REFERENCES Employee(emp_id)
) ENGINE=InnoDB;

