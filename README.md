# CareHub Healthcare Appointment & Test Booking Analysis
SQL analysis of healthcare appointment and blood test booking trends

**Healthcare Appointment & Blood Test Booking Analysis**

Independent SQL + Power BI Project (Dubai Client Dataset)

**Project Overview**

This project analyzes healthcare appointment and blood test booking data for a Dubai-based healthcare provider. The objective was to evaluate booking trends, identify high-demand test categories, and generate operational insights to support resource planning.

The dataset covers appointments from December 2024 to December 2025.

 **Objectives**
	•	Analyze patient booking trends across test categories
	•	Identify top-performing test services
	•	Evaluate physician workload distribution
	•	Examine cancellation patterns
	•	Prepare structured data for dashboard reporting


**Database Structure**

The project was built using MySQL with a relational schema including:

Patients
	•	patient_id (Primary Key)
	•	patient_name
	•	gender
	•	date_of_birth
	•	city

Physicians
	•	physician_id (Primary Key)
	•	physician_name
	•	specialization

Test_Categories
	•	test_id (Primary Key)
	•	test_name
	•	category
	•	price

Appointments
	•	appointment_id (Primary Key)
	•	patient_id (Foreign Key)
	•	physician_id (Foreign Key)
	•	test_id (Foreign Key)
	•	appointment_date
	•	booking_date
	•	status

**Tools & Technologies**
	•	MySQL (Database Design & SQL Analysis)
	•	SQL (JOIN, GROUP BY, Aggregations, Sorting)
	•	Power BI (Dashboard & Visualization)
	•	Excel (Optional Pivot Analysis)

**Key SQL Analysis Performed**

Multi-table JOIN operations to create consolidated reporting datasets
Aggregation by test category to identify top 3 high-demand services
Booking trend analysis by month
Gender-based distribution analysis
Physician workload analysis
Cancellation rate evaluation

**Business Insights**
	•	Identified the top 3 most-booked test categories contributing to overall booking volume
	•	Observed variations in booking distribution across physicians
	•	Highlighted cancellation trends impacting operational scheduling
	•	Generated structured dataset for BI dashboard development

  SELECT 
    t.category,
    COUNT(a.appointment_id) AS total_bookings
FROM Appointments a
JOIN Test_Categories t 
    ON a.test_id = t.test_id
GROUP BY t.category
ORDER BY total_bookings DESC
LIMIT 3;

**Project Outcome**

This project demonstrates:
	•	Relational database modelling
	•	Data aggregation & trend analysis using SQL
	•	Reporting dataset creation
	•	Business-oriented interpretation of healthcare data

Power BI Dashboard – Healthcare Diagnostic Performance

This interactive dashboard analyzes:
	•	Total Appointments
	•	Revenue Performance
	•	Cancellation Rate
	•	Physician Workload
	•	Test Category Trends
	•	Monthly Booking Patterns

Tools Used:
	•	Power BI
	•	DAX
	•	Data Modeling
	•	Excel (Data Cleaning)

 Key Business Insights:
	•	15 total appointments recorded
	•	6.67% cancellation rate
	•	Hematology & Cardiology are leading categories
	•	Revenue generated primarily from completed bookings

Dashboard Preview
	<img width="1920" height="1080" alt="CareHub_PB_Dashboard" src="https://github.com/user-attachments/assets/c4eedf13-a267-4129-89fb-04c9d1888544" />

