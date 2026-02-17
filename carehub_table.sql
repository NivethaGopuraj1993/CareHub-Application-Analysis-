create database carehub;   -- created a database
show databases;
use carehub; -- we are using carehub database for this project

CREATE TABLE Patients (     -- created table in the name of patients
    patient_id INT PRIMARY KEY,  -- patient id is a integer and giving it as a primary key
    patient_name VARCHAR(100),  -- varchar for character upto 100
    gender VARCHAR(10),
    date_of_birth DATE,  -- to mention the date
    city VARCHAR(100)
);

select * from patients;

CREATE TABLE Physicians (  -- Created table in the name of Physicians
    physician_id INT PRIMARY KEY,
    physician_name VARCHAR(100),
    specialization VARCHAR(100)
);

select * from physicians;  -- Run to see the result of Physicians syntax

CREATE TABLE Test_Categories (  -- Created one more table for blood test.
    test_id INT PRIMARY KEY,
    test_name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10,2)
); 

select * from Test_Categories;

CREATE TABLE Appointments ( -- created table for appointment details
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    physician_id INT,
    test_id INT,
    appointment_date DATE,
    booking_date DATE,
    status VARCHAR(50),
    constraint Care_patientid FOREIGN KEY (patient_id) REFERENCES Patients(patient_id), -- added foreign key to connect the patient id from the table patient
    constraint care_physicianid FOREIGN KEY (physician_id) REFERENCES Physicians(physician_id), -- added foreign key to connect the physician id from the table physicians
    constraint care_testid FOREIGN KEY (test_id) REFERENCES Test_Categories(test_id)  -- -- added foreign key to connect the test id from the table test categories
);

select * from appointments;

/* Below inserted the details of the patients */


INSERT INTO Patients VALUES
(1, 'Ahmed Al Mansoori', 'Male', '1990-05-12', 'Dubai'),
(2, 'Fatima Al Zahra', 'Female', '1988-09-21', 'Sharjah'),
(3, 'Omar Khalid', 'Male', '1975-11-03', 'Dubai'),
(4, 'Aisha Rahman', 'Female', '1995-02-14', 'Abu Dhabi'),
(5, 'Yusuf Ibrahim', 'Male', '2000-07-19', 'Dubai'),
(6, 'Sara Khan', 'Female', '1992-12-25', 'Ajman'),
(7, 'Hassan Ali', 'Male', '1983-04-10', 'Dubai'),
(8, 'Noor Ahmed', 'Female', '1998-06-30', 'Sharjah'),
(9, 'Bilal Farooq', 'Male', '1970-01-18', 'Dubai'),
(10, 'Zainab Hussain', 'Female', '1985-03-22', 'Abu Dhabi'),
(11, 'Khaled Mahmoud', 'Male', '1993-08-05', 'Dubai'),
(12, 'Layla Hassan', 'Female', '1999-10-11', 'Ajman'),
(13, 'Mohammed Tariq', 'Male', '1980-09-17', 'Dubai'),
(14, 'Rania Saleh', 'Female', '1996-12-01', 'Sharjah'),
(15, 'Imran Sheikh', 'Male', '1987-07-09', 'Dubai');

/* Below inserted the details of the Physicians */

INSERT INTO Physicians VALUES
(1, 'Dr. Sameer Qureshi', 'General Physician'),
(2, 'Dr. Leena Mathew', 'Hematologist'),
(3, 'Dr. Faisal Khan', 'Cardiologist'),
(4, 'Dr. Mariam Saeed', 'Pathologist');

/* Below inserted the details of the Test Categories */

INSERT INTO Test_Categories VALUES
(1, 'Complete Blood Count', 'Hematology', 150.00),
(2, 'Lipid Profile', 'Cardiology', 250.00),
(3, 'Blood Glucose Test', 'Diabetes', 100.00),
(4, 'Thyroid Function Test', 'Hormonal', 200.00),
(5, 'Vitamin D Test', 'General Health', 180.00),
(6, 'Iron Studies', 'Hematology', 220.00);

/* Below inserted the details of the Appointment Data */

INSERT INTO Appointments VALUES
(101, 1, 1, 1, '2024-12-10', '2024-12-05', 'Completed'),
(102, 2, 2, 2, '2024-12-15', '2024-12-10', 'Completed'),
(103, 3, 3, 2, '2025-01-12', '2025-01-05', 'Completed'),
(104, 4, 1, 3, '2025-02-18', '2025-02-10', 'Completed'),
(105, 5, 2, 1, '2025-03-09', '2025-03-01', 'Completed'),
(106, 6, 4, 4, '2025-04-22', '2025-04-15', 'Completed'),
(107, 7, 3, 2, '2025-05-10', '2025-05-05', 'Cancelled'),
(108, 8, 1, 5, '2025-06-14', '2025-06-07', 'Completed'),
(109, 9, 2, 6, '2025-07-19', '2025-07-12', 'Completed'),
(110, 10, 3, 2, '2025-08-25', '2025-08-20', 'Completed'),
(111, 11, 4, 1, '2025-09-03', '2025-08-29', 'Completed'),
(112, 12, 1, 3, '2025-10-11', '2025-10-05', 'Completed'),
(113, 13, 2, 1, '2025-11-17', '2025-11-10', 'Completed'),
(114, 14, 3, 2, '2025-12-05', '2025-11-28', 'Completed'),
(115, 15, 4, 5, '2025-12-20', '2025-12-15', 'Completed');

/* Performing Analysis */
/* Total Booking */

SELECT COUNT(*) FROM Appointments; -- Have mentioned the "COUNT" to count the Total Bookings including cancelled

/* Monthly Trend*/
SELECT 
    MONTH(appointment_date) AS month,  -- Here we are checking the "MONTH" in appointment date and given name as month
    COUNT(*) AS total_bookings    -- "COUNT (*)" means count all the rows 
FROM Appointments -- from the table appointment
GROUP BY MONTH(appointment_date)  -- "GROUP BY" without grouping the appontment_date we can't "ORDER BY"
ORDER BY month;   -- "ORDER BY" it will order it.

/* “Which types of medical tests are booked the most?” */

SELECT 
    t.category,
    COUNT(a.appointment_id) AS total_bookings
FROM Appointments a
JOIN Test_Categories t 
    ON a.test_id = t.test_id
GROUP BY t.category
ORDER BY total_bookings DESC
LIMIT 3;

SELECT 
    status,
    COUNT(*) AS total
FROM Appointments
GROUP BY status;


SELECT 
    p.patient_id,
    p.patient_name,
    ph.physician_name,
    t.test_name,
    t.category
FROM Appointments a
JOIN Patients p 
    ON a.patient_id = p.patient_id
JOIN Physicians ph 
    ON a.physician_id = ph.physician_id
JOIN Test_Categories t 
    ON a.test_id = t.test_id
    order by patient_id;

