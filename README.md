# 🏛️ SEBI Regulatory Database System

<div align="center">

**A comprehensive MySQL database modeling the operations of India's Securities and Exchange Board**

![Database](https://img.shields.io/badge/Database-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge)

[Features](#-features) • [Architecture](#️-architecture) • [Installation](#-quick-start) • [Documentation](#-documentation) • [Use Cases](#-use-cases)

</div>

---

## 📋 Overview

The **SEBI Regulatory Database System** is a fully-normalized relational database that simulates the comprehensive operations of a financial market regulatory authority. It captures the entire ecosystem of regulatory workflows, from intermediary management to enforcement actions, making it an ideal resource for academic projects, data analytics, and understanding regulatory frameworks.

### Why This Database?

- **Real-world modeling** of regulatory authority operations
- **12 interconnected tables** representing complete regulatory workflows
- **Normalized to 3NF** ensuring data integrity and efficiency
- **Sample data included** for immediate experimentation
- **Production-ready schema** suitable for adaptation to real systems

---

## ✨ Features

### 🏢 Intermediary Management
- Track market participants (Brokers, Mutual Funds, RTAs, Depositories)
- Manage registration lifecycles (initial, renewal, surrender)
- Monitor intermediary status and compliance

### 🔍 Investigation & Enforcement
- Log investigation cases with department assignments
- Record penalty actions (fines, warnings, suspensions, debarments)
- Link violations to specific intermediaries

### 📞 Investor Services
- Comprehensive complaint management system
- Track complaint status from filing to resolution
- Department-wise complaint routing

### 🏛️ Internal Organization
- Board member hierarchy (Chairman, WTM, Members)
- Department structure with leadership mapping
- Regional office network across India
- Employee records with department assignments

### 📊 Data & Analytics
- Metadata repository for regulatory datasets
- Analytics project tracking with dataset linkages
- Research and compliance monitoring capabilities

---

## 🏗️ Architecture

The database is organized into **6 logical modules**:

```
┌─────────────────────────────────────────────────────────────┐
│                    SEBI Database Ecosystem                   │
├─────────────────────────────────────────────────────────────┤
│  📁 Intermediary Management                                  │
│     ├── Intermediary_Type                                    │
│     ├── Intermediary                                         │
│     └── Registration                                         │
├─────────────────────────────────────────────────────────────┤
│  🔎 Investigations & Enforcement                             │
│     ├── Investigation_Case                                   │
│     └── Penalty_Action                                       │
├─────────────────────────────────────────────────────────────┤
│  📞 Investor Services                                        │
│     └── Complaint                                            │
├─────────────────────────────────────────────────────────────┤
│  🏛️ Internal Organization                                    │
│     ├── SEBI_BoardMember                                     │
│     ├── Department                                           │
│     ├── RegionalOffice                                       │
│     └── Employee                                             │
├─────────────────────────────────────────────────────────────┤
│  📊 Data & Analytics                                         │
│     ├── DataSet                                              │
│     └── Analytics_Project                                    │
└─────────────────────────────────────────────────────────────┘
```

### Key Design Principles

✅ **Third Normal Form (3NF)** - Eliminates redundancy and ensures data integrity  
✅ **Referential Integrity** - Strong FK relationships maintain consistency  
✅ **ENUM Types** - Controlled vocabularies for status fields  
✅ **Modular Design** - Clear separation of concerns across modules  
✅ **Scalable Structure** - Easy to extend with additional modules

---

## 🚀 Quick Start

### Prerequisites

- MySQL 8.0 or higher
- MySQL Workbench (optional, for viewing ERD)

### Installation

**Step 1:** Clone the repository
```bash
git clone https://github.com/yourusername/sebi-regulatory-database.git
cd sebi-regulatory-database
```

**Step 2:** Create the database schema
```sql
SOURCE database/schema/tables.sql;
```

**Step 3:** Load sample data
```sql
SOURCE database/schema/attributes.sql;
```

**Step 4:** Verify installation
```sql
SHOW TABLES;
SELECT COUNT(*) FROM Intermediary;
```

---

## 📊 Sample Queries

### Find all active intermediaries
```sql
SELECT name, city, status, registration_date 
FROM Intermediary 
WHERE status = 'Active'
ORDER BY registration_date DESC;
```

### View pending complaints
```sql
SELECT c.complaint_id, c.complaint_date, i.name AS intermediary, 
       d.dept_name, c.description
FROM Complaint c
JOIN Intermediary i ON c.interm_id = i.interm_id
JOIN Department d ON c.dept_id = d.dept_id
WHERE c.complaint_status = 'Open';
```

### Calculate total penalties collected
```sql
SELECT 
    COUNT(*) AS total_actions,
    SUM(amount) AS total_penalties,
    AVG(amount) AS avg_penalty
FROM Penalty_Action
WHERE amount IS NOT NULL;
```

### Department-wise investigation load
```sql
SELECT d.dept_name, COUNT(ic.case_id) AS active_cases
FROM Department d
LEFT JOIN Investigation_Case ic ON d.dept_id = ic.dept_id
WHERE ic.case_status = 'Under Investigation'
GROUP BY d.dept_name
ORDER BY active_cases DESC;
```

---

## 📚 Documentation

| Document | Description |
|----------|-------------|
| `docs/ERD.png` | Visual entity-relationship diagram |
| `docs/data-dictionary.md` | Field-level descriptions for all tables |
| `docs/database-design.md` | Detailed architecture explanation |
| `database/schema/eer-diagram.mwb` | MySQL Workbench model file |

---

## 💼 Use Cases

This database is perfect for:

- 📚 **Academic Projects** - Database design coursework and capstone projects
- 📊 **Data Analytics** - Practice SQL, Python pandas, or R with realistic data
- 📈 **Business Intelligence** - Build dashboards in Tableau, Power BI, or Looker
- 🎓 **Learning SQL** - Complex queries with multiple JOINs and aggregations
- 🏦 **Finance Domain Study** - Understand regulatory structures and workflows
- 🔧 **Data Engineering** - ETL pipeline development and testing
- 🎯 **Interview Preparation** - Demonstrate database design skills

---

## 🛠️ Future Enhancements

Potential extensions to make the system even more comprehensive:

- [ ] **Audit Trail Module** - Track all data modifications with timestamps
- [ ] **Market Surveillance** - Real-time trading anomaly detection logs
- [ ] **Compliance Visits** - On-site inspection records and findings
- [ ] **Financial Reporting** - Intermediary financial statements and ratios
- [ ] **Alert System** - Rule-based triggers for regulatory violations
- [ ] **Document Management** - Link to regulatory filings and submissions
- [ ] **API Layer** - RESTful endpoints for external system integration

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- Inspired by the real-world operations of SEBI (Securities and Exchange Board of India)
- Designed as an educational resource for database modeling and financial domain understanding
- Built with best practices in relational database design

---

<div align="center">

**⭐ Star this repository if you find it useful!**

Made with ❤️ for the database and finance community

[Report Bug](https://github.com/yourusername/sebi-regulatory-database/issues) • [Request Feature](https://github.com/yourusername/sebi-regulatory-database/issues)

</div>
