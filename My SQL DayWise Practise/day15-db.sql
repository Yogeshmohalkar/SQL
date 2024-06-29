CREATE DATABASE day15;
USE day15;

CREATE TABLE employee (
	eid INT PRIMARY KEY AUTO_INCREMENT,
    ename VARCHAR(50),
    email VARCHAR(50),
    job_title VARCHAR(50),
    salary INT
);

INSERT INTO employee(ename, email, job_title, salary) 
VALUES
('ABC', 'abc@sample.com', 'Data Analyst', 50000),
('PQR', 'pqr@sample.com', 'Data Engineer', 70000),
('XYZ', 'xyz@sample.com', 'Data Analyst', 50000),
('LMN', 'lmn@sample.com', 'Data Entry Operator', 20000);

CREATE TABLE employee_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    eid INT NOT NULL,
    prev_ename VARCHAR(50) DEFAULT '---',
    current_ename VARCHAR(50) DEFAULT '---',
    prev_job_title VARCHAR(50) DEFAULT '---',
    current_job_title VARCHAR(50) DEFAULT '---',
    prev_salary INT DEFAULT 0,
    current_salary INT,
    _change_date DATETIME ,
    _action VARCHAR(50)
);