-- Creating tables from imported csv
CREATE TABLE titles (
    title_id VARCHAR(10) NOT NULL,
    title VARCHAR(30)
);

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(10),
    birth_date DATE,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    sex VARCHAR(10),
    hire_date DATE
);

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT
);

CREATE TABLE departments (
    dept_no VARCHAR(10) NOT NULL,
    dept_name VARCHAR(30)
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(10) NOT NULL
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL,
    emp_no INT NOT NULL
);

-- Altering tables to input primary and foreign keys
ALTER TABLE departments ADD CONSTRAINT pk_departments PRIMARY KEY(dept_no);

ALTER TABLE dept_emp ADD CONSTRAINT pk_dept_emp PRIMARY KEY(dept_no, emp_no);

ALTER TABLE dept_manager ADD CONSTRAINT pk_dept_manager PRIMARY KEY(dept_no, emp_no);

ALTER TABLE employees ADD CONSTRAINT pk_employees PRIMARY KEY(emp_no);

ALTER TABLE titles ADD CONSTRAINT pk_titles PRIMARY KEY(title_id);

ALTER TABLE employees ADD CONSTRAINT fk_employees_titles FOREIGN KEY(emp_title_id) REFERENCES titles(title_id);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_employees FOREIGN KEY(emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_departments FOREIGN KEY(dept_no) REFERENCES departments(dept_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_employees FOREIGN KEY(emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_departments FOREIGN KEY(dept_no) REFERENCES departments(dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_employees FOREIGN KEY(emp_no) REFERENCES employees(emp_no);
