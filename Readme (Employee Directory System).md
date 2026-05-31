
# 🗄️ HR Employee Directory System


A production-style relational database simulating HR operations for a 200-person company across 5 departments and 5 active projects. Built to demonstrate real-world SQL skills: schema design, normalization, analytical queries, performance optimization, stored procedures, triggers, audit logging, and self-documenting metadata.

---

## 📋 Table of Contents

- [Problem Statement]
- [Database Schema]
- [Key Features]
- [Analysis Queries]
- [Views]
- [Stored Procedures]
- [Triggers]
- [Indexes]
- [Key Insights]
- [Skills Demonstrated]
- [How to Run]

---

## 📌 Problem Statement

Design and build a fully normalized HR database that can:
- Track employees, departments, and project assignments
- Model manager–employee reporting hierarchies using a self-referencing FK
- Enforce data integrity at the schema level with constraints and triggers
- Support analytical queries for business decision-making
- Audit salary changes automatically with full change history
- Be self-documenting through an internal metadata table

---

## 🗃️ Database Schema

### Tables Overview

| Table                   | Rows     | Purpose                                   |
|-------------------------|----------|---------------------------------------- --|
| `Departments`           | 5        | Department names and city locations       |
| `Employees`             | 200      | Employee records with manager hierarchy   |
| `Projects`              | 5        | Active projects with budgets              |
| `Employee_Projects`     | 200      | Junction table — hours logged per project |
| `Salary_Audit_Log`      | dynamic  | Auto-populated salary change history      |
| `Project_Documentation` | 15       | Self-documenting metadata catalog         |


### Entity Relationships

```
Departments ──<  Employees           (one-to-many)
Departments ──<  Projects            (one-to-many)
Employees   ──<  Employees           (self-referencing FK — manager hierarchy)
Employees  >──<  Projects            (many-to-many via Employee_Projects)
Employees   ──>  Salary_Audit_Log    (auto-populated by trigger)
```


## Tables

### 01 Departments Table
```sql
CREATE TABLE Departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50)  NOT NULL,
    location  VARCHAR(100)
);
```
### 02 Employees Table
```sql
CREATE TABLE Employees (
    emp_id   INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(255) DEFAULT NULL,
    email    VARCHAR(255) DEFAULT NULL,
    phone    VARCHAR(20)  DEFAULT NULL,
    hire_date DATE DEFAULT NULL,
    Salary   INT DEFAULT NULL,
    dept_id  INT DEFAULT NULL,
    Manager_id INT DEFAULT NULL,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id),
    FOREIGN KEY (Manager_id) REFERENCES Employees(emp_id)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);
```
### 03 Projects Table
```sql
CREATE TABLE Projects (
    project_id   INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    budget       DECIMAL(12,2),
    dept_id      INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
```
### 04 Employee_Projects Table
```sql
CREATE TABLE Employee_Projects (
    emp_id       INT,
    project_id   INT,
    hours_worked INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id)     REFERENCES Employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);
```
### 05 Salary_Audit_Log Table
```sql
CREATE TABLE Salary_Audit_Log (
    audit_id    INT AUTO_INCREMENT PRIMARY KEY,
    emp_id      INT,
    emp_name    VARCHAR(255),
    old_salary  INT,
    new_salary  INT,
    changed_by  VARCHAR(100),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_sal_emp_id     (emp_id),
    INDEX idx_sal_change_date (change_date)
);
```
### 06 Project_Documentation Table
```sql
CREATE TABLE Project_Documentation (
    doc_id       INT AUTO_INCREMENT PRIMARY KEY,
    category     VARCHAR(50),
    item_name    VARCHAR(100),
    description  TEXT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## ⚡ Key Features

| Feature           | Detail                                                      |
|-------------------|-------------------------------------------------------------|
| 200 employees     | emp_id range: 100 – 299                                     |
| 5 departments     | Engineering, Sales, HR, Marketing, Finance                  |
| 5 projects        | Total budget: **$44,000,000**                               |
| Salary range      | $40,396 – $149,706                                          |
| Hire date range   | 2020 – 2026                                                 |
| Manager hierarchy | Self-referencing FK with ON UPDATE/DELETE CASCADE           |
| Data integrity    | CHECK constraints + BEFORE INSERT trigger (dual protection) |
| Audit logging     | AFTER UPDATE trigger — captures who changed what and when   |
| Metadata          | Internal documentation table catalogs all DB objects        |


## 📊 Analysis Queries

### 01 — Total Salary Expense per Department
```sql
SELECT d.dept_name,
       SUM(e.salary)   AS total_salary_per_dept,
       COUNT(e.emp_id) AS headcount
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_id
ORDER BY total_salary_per_dept DESC;
```

### 02 — Employee–Manager Hierarchy
```sql
SELECT e.emp_name AS employee, e.emp_id, e.salary,
       d.dept_name, m.emp_name AS reports_to
FROM employees e
JOIN departments d ON e.dept_id   = d.dept_id
JOIN employees m  ON e.manager_id = m.emp_id
ORDER BY e.salary DESC;
```

### 03 — Total Hours Worked per Project
```sql
SELECT p.project_id, p.project_name,
       SUM(ep.hours_worked) AS total_hours_per_project
FROM projects p
LEFT JOIN employee_projects ep ON p.project_id = ep.project_id
GROUP BY p.project_id
ORDER BY total_hours_per_project DESC;
```

### 04 — Project Assignments per Employee
```sql
SELECT e.emp_name, ep.emp_id,
       COUNT(ep.project_id) AS total_projects_assigned
FROM employees e
JOIN employee_projects ep ON e.emp_id = ep.emp_id
GROUP BY e.emp_id;
```

### 05 — Employees with Under 50 Hours Logged
```sql
SELECT ep.emp_id, e.emp_name,
       SUM(ep.hours_worked) AS total_hours_worked
FROM employee_projects ep
JOIN employees e ON e.emp_id = ep.emp_id
GROUP BY ep.emp_id
HAVING SUM(ep.hours_worked) < 50
ORDER BY SUM(ep.hours_worked) DESC;
```

### 06 — Highest Paid Employee per Department (Window Function)
```sql
SELECT emp_name, dept_name, salary, ranking
FROM (
    SELECT e.emp_name, d.dept_name, e.salary,
           RANK() OVER (PARTITION BY e.dept_id ORDER BY e.salary DESC) AS ranking
    FROM employees e
    JOIN departments d ON e.dept_id = d.dept_id
) ranked
WHERE ranking = 1;
```

### 07 — Budget Efficiency (Cost per Hour)
```sql
SELECT p.project_name,
       SUM(ep.hours_worked) AS total_hours_logged,
       p.budget,
       ROUND(p.budget / NULLIF(SUM(ep.hours_worked), 0), 2) AS cost_per_hour
FROM Projects p
JOIN Employee_Projects ep ON p.project_id = ep.project_id
GROUP BY p.project_id;
```

---

## 👁️ Views

### Executive Dashboard
Company-wide KPIs in a single query — total employees, departments, projects, budget, average salary, and total hours logged.

### Department Performance
Per-department breakdown: headcount, average salary, employees on projects, total project hours, and total budget.

### Employee Workload
Individual employee summary: project count and total hours, ordered by workload.

### Project Completion Report
Auto-generated summary of all DB objects using `information_schema`.

```sql
SELECT * FROM Executive_Dashboard;
SELECT * FROM Department_Performance;
SELECT * FROM Employee_Workload ORDER BY total_hours DESC;
SELECT * FROM Project_Completion_Report;
```

---

## 🔧 Stored Procedures

### GetDeptSummary(dept_name)
Returns headcount, average salary, and total payroll for any department by name.

```sql
CALL GetDeptSummary('Engineering');
CALL GetDeptSummary('HR');
CALL GetDeptSummary('Sales');
CALL GetDeptSummary('Marketing');
CALL GetDeptSummary('Finance');
```

---

## ⚙️ Triggers

### salary_change_audit — AFTER UPDATE
Automatically logs every salary change to `Salary_Audit_Log`, capturing old salary, new salary, the user (`USER()`), and timestamp.

### validate_salary — BEFORE INSERT
Blocks any insert with salary below $30,000 using `SIGNAL SQLSTATE` with a custom error message — second layer of protection alongside the CHECK constraint.

```sql
-- Trigger the audit log
UPDATE Employees SET Salary = 150000 WHERE emp_id = 100;
SELECT * FROM Salary_Audit_Log;

-- Trigger the validation (expected: throws error)
INSERT INTO Employees VALUES (999,'Test','t@t.com','123','2024-01-01',20000,1,100);
```

---

## 🚀 Indexes

| Index                            | Table             | Column       | Purpose                         |
|----------------------------------|-------------------|--------------|---------------------------------|
| `idx_employees_dept_id`          | Employees         | dept_id      | Speeds up department JOINs      |
| `idx_employees_manager_id`       | Employees         | Manager_id   | Speeds up hierarchy queries     |
| `idx_projects_dept_id`           | Projects          | dept_id      | Speeds up project–dept JOINs    |
| `idx_employee_projects_emp_id`   | Employee_Projects | emp_id       | Speeds up employee lookups      |
| `idx_employee_projects_proj_id`  | Employee_Projects | project_id   | Speeds up project lookups       |
| `idx_departments_dept_name`      | Departments       | dept_name    | Speeds up name-based searches   |
| `idx_projects_project_name`      | Projects          | project_name | Speeds up project name searches |
| `idx_employees_emp_name`         | Employees         | emp_name     | Speeds up name searches         |
| `idx_employees_email`            | Employees         | email        | Speeds up email lookups         |

---

## 💡 Key Insights

- **Brand Refresh** carries the largest single budget at **$20M** — 45% of all project spend
- **Self-referencing FK** on `manager_id` with `ON DELETE CASCADE` models the full org hierarchy in one table — no separate managers table needed
- **Dual salary protection:** a `CHECK` constraint at schema level AND a `BEFORE INSERT` trigger both enforce the $30K minimum — defence in depth
- **`SIGNAL SQLSTATE`** raises a readable custom error — cleaner than relying on constraint violations alone
- **`USER()`** in the audit log records exactly who changed each salary — production-grade accountability
- **Self-documenting database:** `Project_Documentation` catalogs every DB object (tables, views, procedures, triggers, indexes) as queryable metadata

---

## 🛠️ Skills Demonstrated

| Category           | Skills                                                                         |
|--------------------|--------------------------------------------------------------------------------|
| Schema Design      | Normalization, Foreign Keys, Self-referencing Relationships, ON DELETE CASCADE |
| Data Integrity     | CHECK Constraints, BEFORE INSERT Trigger, SIGNAL SQLSTATE                      |
| Querying           | JOINs, Self-Join, LEFT JOIN, GROUP BY, HAVING, ORDER BY                        |
| Window Functions   | RANK() OVER (PARTITION BY), Subqueries                                         |
| Functions          | SUM, COUNT, AVG, ROUND, NULLIF, CONCAT, FORMAT, USER(), NOW()                  |
| Performance        | 9 Indexes on FK and high-traffic columns                                       |
| Views              | UNION ALL, Executive Dashboard, information_schema queries                     |
| Procedures         | DELIMITER syntax, IN parameters, stored logic                                  |
| Triggers           | AFTER UPDATE, BEFORE INSERT, audit logging                                     |
| Metadata           | Self-documenting table, Project_Completion_Report view                         |

---

## ▶️ How to Run

1. Open **MySQL Workbench** or any MySQL 8.0+ client
2. Open `Employee_Directory_System.sql`
3. Run the full script — it creates the database, all tables, inserts all data, and sets up every object
4. Verify with:

```sql
USE Employee_Directory_system;

SELECT * FROM Executive_Dashboard;
SELECT * FROM Department_Performance;
SELECT * FROM Employee_Workload ORDER BY total_hours DESC;
SELECT * FROM Project_Completion_Report;

CALL GetDeptSummary('Engineering');

```
##  📸 Screenshots

### Executive Dashboard
[Executive Dashboard](images/executive_dashboard.png)

### Salary Audit Log (Trigger Working)
[Salary Audit Log](images/salary_audit_log.png)

### Window Function Query
[Window Function](images/window_function.png)

### Project Documentation
[Project Documentation](images/project_documentation.png)

### Database Schema (EER Diagram)
[EER Diagram](images/eer_diagram.png)


```

---

## 👤 Author 
   **SUHAIL ANWAR**
📍 Islamabad, Pakistan
🔗 [LinkedIn Profile](https://www.linkedin.com/in/suhail-anwar-38a429198) 
🔗 [GitHub Profile](https://github.com/suhailanwar817-bit)

---

*Built with MySQL 8.0 · Independent portfolio project*
