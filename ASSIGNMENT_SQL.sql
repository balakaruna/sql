-- 1. BANKING DATABASE

CREATE DATABASE banking_db;
USE banking_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (name, city) VALUES
('Janani','Chennai'),
('Arun','Coimbatore'),
('Priya','Madurai'),
('Karthik','Salem');

INSERT INTO accounts (customer_id, account_type, balance) VALUES
(1,'Savings',50000),
(1,'Current',20000),
(2,'Savings',30000),
(3,'Savings',15000),
(4,'Current',40000);


-- 2. RAILWAY DATABASE

CREATE DATABASE railway_db;
USE railway_db;

CREATE TABLE trains (
    train_id INT PRIMARY KEY AUTO_INCREMENT,
    train_name VARCHAR(50),
    source VARCHAR(50),
    destination VARCHAR(50)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    train_id INT,
    passenger_name VARCHAR(50),
    fare DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (train_id) REFERENCES trains(train_id)
);

INSERT INTO trains (train_name, source, destination) VALUES
('Express1','Chennai','Madurai'),
('Express2','Coimbatore','Salem'),
('Express3','Madurai','Chennai');

INSERT INTO bookings (train_id, passenger_name, fare, status) VALUES
(1,'Janani',500,'Confirmed'),
(1,'Arun',500,'Waiting'),
(2,'Priya',300,'Confirmed'),
(3,'Karthik',450,'Cancelled'),
(2,'Meena',300,'Confirmed');


-- 3. COMPANY DATABASE (Employee, Customers, Orders, Students)

CREATE DATABASE company_db;
USE company_db;

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30),
    joining_date DATE
);

INSERT INTO Employee VALUES
(101,'John','IT',60000,'Chennai','2022-01-15'),
(102,'David','HR',45000,'Bangalore','2021-03-10'),
(103,'Smith','IT',70000,'Chennai','2020-07-12'),
(104,'Mary','Finance',55000,'Mumbai','2023-01-20'),
(105,'James','HR',48000,'Delhi','2022-05-05'),
(106,'Linda','Finance',65000,'Mumbai','2021-08-18');

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);


INSERT INTO Customers VALUES
(1,'Janani','Chennai'),
(2,'Arun','Coimbatore'),
(3,'Priya','Madurai'),
(4,'Karthik','Salem'),
(5,'Meena','Trichy'),
(6,'Ravi','Chennai');

INSERT INTO Orders VALUES
(1001,1,3000,'2026-01-10'),
(1002,1,2500,'2026-02-14'),
(1003,1,4000,'2026-03-05'),
(1004,1,1500,'2026-04-21'),
(1005,2,2000,'2026-01-25'),
(1006,2,3500,'2026-03-18'),
(1007,2,3000,'2026-05-02'),
(1008,3,1200,'2026-02-09'),
(1009,3,800,'2026-06-30'),
(1010,4,5500,'2026-04-12'),
(1011,5,2200,'2026-05-20'),
(1012,5,2600,'2026-07-08');

INSERT INTO Students VALUES
(1,'Anitha','CSE',92),
(2,'Bala','CSE',85),
(3,'Chitra','CSE',78),
(4,'Dinesh','CSE',81),
(5,'Eswari','CSE',76),
(6,'Farook','CSE',88),
(7,'Gopi','ECE',70),
(8,'Hema','ECE',65),
(9,'Ilango','ECE',82),
(10,'Jeeva','ECE',74),
(11,'Kavya','MECH',60),
(12,'Logesh','MECH',72),
(13,'Madhu','MECH',68),
(14,'Nithya','IT',95),
(15,'Om','IT',79),
(16,'Pavan','IT',84),
(17,'Qadir','IT',77),
(18,'Revathi','IT',90);


USE banking_db;

-- Basic + WHERE + Operators (1-15)

-- 1. Accounts with balance greater than 20,000
SELECT * FROM accounts WHERE balance > 20000;

-- 2. Customers who live in Chennai
SELECT * FROM customers WHERE city = 'Chennai';

-- 3. Accounts with balance between 20,000 and 50,000
SELECT * FROM accounts WHERE balance BETWEEN 20000 AND 50000;

-- 4. Customers whose names start with 'J'
SELECT * FROM customers WHERE name LIKE 'J%';

-- 5. Accounts of type 'Savings' or 'Current'
SELECT * FROM accounts WHERE account_type = 'Savings' OR account_type = 'Current';

-- 6. Accounts that are not 'Savings'
SELECT * FROM accounts WHERE account_type <> 'Savings';

-- 7. Customers whose names contain the letter 'a'
SELECT * FROM customers WHERE name LIKE '%a%';

-- 8. Accounts with balance <= 30,000
SELECT * FROM accounts WHERE balance <= 30000;

-- 9. Customers not from Madurai
SELECT * FROM customers WHERE city <> 'Madurai';

-- 10. Accounts where balance is NOT between 10,000 and 40,000
SELECT * FROM accounts WHERE balance NOT BETWEEN 10000 AND 40000;

-- 11. Customers whose names end with 'i'
SELECT * FROM customers WHERE name LIKE '%i';

-- 12. Accounts with balance equal to 50,000
SELECT * FROM accounts WHERE balance = 50000;

-- 13. Customers whose city is either Chennai or Salem
SELECT * FROM customers WHERE city IN ('Chennai', 'Salem');

-- 14. Accounts with balance > 10,000 and < 40,000
SELECT * FROM accounts WHERE balance > 10000 AND balance < 40000;

-- 15. Accounts where account type is not in ('Current')
SELECT * FROM accounts WHERE account_type NOT IN ('Current');


-- ORDER BY 

-- 16. All accounts sorted by balance descending
SELECT * FROM accounts ORDER BY balance DESC;

-- 17. Customers sorted alphabetically by name
SELECT * FROM customers ORDER BY name ASC;

-- 18. Accounts sorted by account type, then balance descending
SELECT * FROM accounts ORDER BY account_type ASC, balance DESC;


-- Aggregate Functions 

-- 19. Total balance of all accounts
SELECT SUM(balance) AS total_balance FROM accounts;

-- 20. Average balance
SELECT AVG(balance) AS average_balance FROM accounts;

-- 21. Maximum balance
SELECT MAX(balance) AS max_balance FROM accounts;

-- 22. Minimum balance
SELECT MIN(balance) AS min_balance FROM accounts;

-- 23. Total number of customers
SELECT COUNT(*) AS total_customers FROM customers;


-- GROUP BY + HAVING 

-- 24. Total balance grouped by account type
SELECT account_type, SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type;

-- 25. Average balance for each account type
SELECT account_type, AVG(balance) AS avg_balance
FROM accounts
GROUP BY account_type;

-- 26. Account types having average balance > 20,000
SELECT account_type, AVG(balance) AS avg_balance
FROM accounts
GROUP BY account_type
HAVING AVG(balance) > 20000;

-- 27. Number of accounts for each customer
SELECT customer_id, COUNT(*) AS num_accounts
FROM accounts
GROUP BY customer_id;

-- 28. Customers having more than one account
SELECT customer_id, COUNT(*) AS num_accounts
FROM accounts
GROUP BY customer_id
HAVING COUNT(*) > 1;


-- JOINS 

-- 29. Customer names along with their account balances
SELECT c.name, a.balance
FROM customers c
INNER JOIN accounts a ON c.customer_id = a.customer_id;

-- 30. All customers and their accounts (including customers without accounts)
SELECT c.customer_id, c.name, c.city, a.account_id, a.account_type, a.balance
FROM customers c
LEFT JOIN accounts a ON c.customer_id = a.customer_id;

-- 31. All accounts and corresponding customer details
SELECT a.account_id, a.account_type, a.balance, c.customer_id, c.name, c.city
FROM accounts a
LEFT JOIN customers c ON a.customer_id = c.customer_id;

-- 32. Customer names and account types where balance > 20,000
SELECT c.name, a.account_type
FROM customers c
INNER JOIN accounts a ON c.customer_id = a.customer_id
WHERE a.balance > 20000;

-- 33. Customers with their total balance
SELECT c.customer_id, c.name, SUM(a.balance) AS total_balance
FROM customers c
INNER JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name;

-- 34. Customer names and balances sorted by balance
SELECT c.name, a.balance
FROM customers c
INNER JOIN accounts a ON c.customer_id = a.customer_id
ORDER BY a.balance;

-- 35. Number of accounts for each city
SELECT c.city, COUNT(a.account_id) AS num_accounts
FROM customers c
INNER JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.city;


-- SUBQUERIES 

-- 36. Accounts with balance greater than average balance
SELECT * FROM accounts
WHERE balance > (SELECT AVG(balance) FROM accounts);

-- 37. Customers who have accounts
SELECT * FROM customers
WHERE customer_id IN (SELECT customer_id FROM accounts);

-- 38. Customers who do not have any accounts
SELECT * FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM accounts WHERE customer_id IS NOT NULL);

-- 39. Account(s) with the maximum balance
SELECT * FROM accounts
WHERE balance = (SELECT MAX(balance) FROM accounts);

-- 40. Customers whose total balance is greater than 40,000
SELECT * FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM accounts
    GROUP BY customer_id
    HAVING SUM(balance) > 40000
);


-- RAILWAY RESERVATION SCENARIO

USE railway_db;

-- 41. Bookings with fare greater than 400
SELECT * FROM bookings WHERE fare > 400;

-- 42. Bookings where status is not 'Confirmed'
SELECT * FROM bookings WHERE status <> 'Confirmed';

-- 43. Trains starting from Chennai
SELECT * FROM trains WHERE source = 'Chennai';

-- 44. Bookings with fare between 300 and 500
SELECT * FROM bookings WHERE fare BETWEEN 300 AND 500;

-- 45. Passengers whose names start with 'A'
SELECT * FROM bookings WHERE passenger_name LIKE 'A%';

-- 46. Train names along with passenger names
SELECT t.train_name, b.passenger_name
FROM trains t
INNER JOIN bookings b ON t.train_id = b.train_id;

-- 47. Number of bookings for each train
SELECT t.train_name, COUNT(b.booking_id) AS num_bookings
FROM trains t
LEFT JOIN bookings b ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name;

-- 48. Train names and total fare collected for each train
SELECT t.train_name, SUM(b.fare) AS total_fare
FROM trains t
INNER JOIN bookings b ON t.train_id = b.train_id
GROUP BY t.train_id, t.train_name
ORDER BY total_fare DESC;

-- 49. Bookings with fare equal to the highest fare
SELECT * FROM bookings
WHERE fare = (SELECT MAX(fare) FROM bookings);

-- 50. Trains that have more than one booking
SELECT * FROM trains
WHERE train_id IN (
    SELECT train_id
    FROM bookings
    GROUP BY train_id
    HAVING COUNT(*) > 1
);


-- EMPLOYEE MANAGEMENT

USE company_db;

-- 1. Number of employees in each department
SELECT department, COUNT(*) AS total_employees
FROM Employee
GROUP BY department;

-- 2. Average salary in each department
SELECT department, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department;

-- 3. Departments having more than one employee
SELECT department, COUNT(*) AS total_employees
FROM Employee
GROUP BY department
HAVING COUNT(*) > 1;

-- 4. Highest salary in each department
SELECT department, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department;

-- 5. Lowest salary in each department
SELECT department, MIN(salary) AS lowest_salary
FROM Employee
GROUP BY department;

-- 6. Departments whose average salary is greater than 50,000
SELECT department, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department
HAVING AVG(salary) > 50000;

-- 7. Total salary expenditure for each department
SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department;

-- 8. All employees sorted by salary descending
SELECT * FROM Employee ORDER BY salary DESC;

-- 9. Employees sorted by department, then salary descending
SELECT * FROM Employee ORDER BY department ASC, salary DESC;

-- 10. Cities that have more than one employee
SELECT city, COUNT(*) AS total_employees
FROM Employee
GROUP BY city
HAVING COUNT(*) > 1;

-- 11. Total salary paid in each city
SELECT city, SUM(salary) AS total_salary
FROM Employee
GROUP BY city;

-- 12. Departments ordered by total salary expenditure (high to low)
SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department
ORDER BY total_salary DESC;

-- 13. Employees per department whose salary is greater than 50,000
SELECT department, COUNT(*) AS total_employees
FROM Employee
WHERE salary > 50000
GROUP BY department;

-- 14. Difference between highest and lowest salary in each department
SELECT department, MAX(salary) - MIN(salary) AS salary_difference
FROM Employee
GROUP BY department;

-- 15. Top 3 highest-paid employees
SELECT * FROM Employee ORDER BY salary DESC LIMIT 3;



-- CUSTOMERS & ORDERS


-- 16. Total order amount for each customer
SELECT customer_id, SUM(amount) AS total_amount
FROM Orders
GROUP BY customer_id;

-- 17. Customers who have placed more than 3 orders
SELECT customer_id, COUNT(*) AS total_orders
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) > 3;

-- 18. Average order amount for each customer
SELECT customer_id, AVG(amount) AS avg_amount
FROM Orders
GROUP BY customer_id;

-- 19. Highest order amount placed by each customer
SELECT customer_id, MAX(amount) AS highest_amount
FROM Orders
GROUP BY customer_id;


-- STUDENTS


-- 31. Average marks in each department
SELECT department, AVG(marks) AS avg_marks
FROM Students
GROUP BY department;

-- 32. Departments whose average marks are above 75
SELECT department, AVG(marks) AS avg_marks
FROM Students
GROUP BY department
HAVING AVG(marks) > 75;

-- 33. Highest mark in each department
SELECT department, MAX(marks) AS highest_mark
FROM Students
GROUP BY department;

-- 34. Total number of students in each department
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department;

-- 35. Departments having more than 5 students
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department
HAVING COUNT(*) > 5;

-- 36. Departments sorted by average marks (descending)
SELECT department, AVG(marks) AS avg_marks
FROM Students
GROUP BY department
ORDER BY avg_marks DESC;

-- 37. Top 3 departments based on average marks
SELECT department, AVG(marks) AS avg_marks
FROM Students
GROUP BY department
ORDER BY avg_marks DESC
LIMIT 3;

-- 38. Departments whose average marks are between 70 and 90
SELECT department, AVG(marks) AS avg_marks
FROM Students
GROUP BY department
HAVING AVG(marks) BETWEEN 70 AND 90;

-- 39. Total marks scored by students in each department
SELECT department, SUM(marks) AS total_marks
FROM Students
GROUP BY department;

-- 40. Departments sorted by number of students
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department
ORDER BY total_students DESC;

-- 41. Lowest mark in each department
SELECT department, MIN(marks) AS lowest_mark
FROM Students
GROUP BY department;

-- 42. Departments where the highest mark is greater than 90
SELECT department, MAX(marks) AS highest_mark
FROM Students
GROUP BY department
HAVING MAX(marks) > 90;

-- 43. Number of students scoring above 80 in each department
SELECT department, COUNT(*) AS students_above_80
FROM Students
WHERE marks > 80
GROUP BY department;

-- 44. Departments where more than 3 students scored above 75
SELECT department, COUNT(*) AS students_above_75
FROM Students
WHERE marks > 75
GROUP BY department
HAVING COUNT(*) > 3;

-- 45. Departments ordered by highest mark (descending)
SELECT department, MAX(marks) AS highest_mark
FROM Students
GROUP BY department
ORDER BY highest_mark DESC;