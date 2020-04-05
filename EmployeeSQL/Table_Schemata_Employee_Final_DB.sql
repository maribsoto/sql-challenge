-- NOTES:	* CSVs were reviewed and sketched out as ERD - http://www.quickdatabasediagrams.com.
--			* A Database named Employees_DB was created @PostgreSQL
--			* Below you can find the script and corresponding table schemas that were 
--			created for the six CSV files 
-- 			* Details on data types, primary keys, foreign keys, and other constraints were
--			provided
--			* CSV file were imported into the corresponding SQL table

-- Comments from QuickDBD: 
--		Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- 		Link to schema: https://app.quickdatabasediagrams.com/#/d/FbF7jD
-- 		NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- 	The 6 table schemas that are created as follows como from the ERD of 
--	the tables (CSV files)

CREATE TABLE "Employees" (
    "emp_no" INTEGER   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR(14)   NOT NULL,
    "last_name" VARCHAR(16)   NOT NULL,
    "gender" VARCHAR(2)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" money   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "Titles" (
    "emp_no" INTEGER   NOT NULL,
    "title" VARCHAR(18)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "Departments" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(18)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_Employees" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "Dept_Manager" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

-- Tables were altered to define PK, FK and other relationships and constraints
ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Employees" ADD CONSTRAINT "fk_Dept_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Employees" ADD CONSTRAINT "fk_Dept_Employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

-- All Tables were renamed to remove quotation marks and avoid problems while running the exercises

ALTER TABLE "Employees" RENAME TO Employees;
ALTER TABLE "Salaries" RENAME TO Salaries;
ALTER TABLE "Titles" RENAME TO Titles;
ALTER TABLE "Departments" RENAME TO Departments;
ALTER TABLE "Dept_Employees" RENAME TO Dept_Employees;
ALTER TABLE "Dept_Manager" RENAME TO Dept_Manager;

-- The Employees_DB is complete 


