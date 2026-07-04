-- ============================================
-- Project: Healthcare Appointment & Hospital Analytics
-- Database Creation
-- ============================================

CREATE DATABASE healthcare_analytics;

USE healthcare_analytics;
-- ============================================
-- Table: Departments
-- Stores hospital department information
-- ============================================

CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50) NOT NULL
);

CREATE TABLE Doctors (
    Doctor_ID INT PRIMARY KEY,
    Doctor_Name VARCHAR(100) NOT NULL,
    Department_ID INT,
    Experience_Years INT,
    Consultation_Fee DECIMAL(10,2),

    FOREIGN KEY (Department_ID)
        REFERENCES Departments(Department_ID)
);
-- ============================================
-- Table: Patients
-- Stores patient information
-- ============================================

CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY,
    Patient_Name VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    Age INT,
    City VARCHAR(50)
);
-- ============================================
-- Table: Appointments
-- Stores appointment details
-- ============================================

CREATE TABLE Appointments (
    Appointment_ID INT PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    Appointment_Date DATE,
    Status VARCHAR(20),

    FOREIGN KEY (Patient_ID)
        REFERENCES Patients(Patient_ID),

    FOREIGN KEY (Doctor_ID)
        REFERENCES Doctors(Doctor_ID)
);
-- ============================================
-- Table: Treatments
-- Stores treatment details for each appointment
-- ============================================

CREATE TABLE Treatments (
    Treatment_ID INT PRIMARY KEY,
    Appointment_ID INT,
    Treatment_Name VARCHAR(100) NOT NULL,
    Treatment_Cost DECIMAL(10,2),

    FOREIGN KEY (Appointment_ID)
        REFERENCES Appointments(Appointment_ID)
);
-- ============================================
-- Table: Medicines
-- Stores medicine details prescribed for treatments
-- ============================================

CREATE TABLE Medicines (
    Medicine_ID INT PRIMARY KEY,
    Treatment_ID INT,
    Medicine_Name VARCHAR(100) NOT NULL,
    Quantity INT,

    FOREIGN KEY (Treatment_ID)
        REFERENCES Treatments(Treatment_ID)
);
-- ============================================
-- Table: Bills
-- Stores billing information for appointments
-- ============================================

CREATE TABLE Bills (
    Bill_ID INT PRIMARY KEY,
    Appointment_ID INT,
    Total_Amount DECIMAL(10,2),
    Payment_Status VARCHAR(20),

    FOREIGN KEY (Appointment_ID)
        REFERENCES Appointments(Appointment_ID)
);
-- ============================================
-- Table: Insurance
-- Stores patient insurance details
-- ============================================

CREATE TABLE Insurance (
    Insurance_ID INT PRIMARY KEY,
    Patient_ID INT,
    Provider VARCHAR(100) NOT NULL,
    Coverage_Percentage INT,

    FOREIGN KEY (Patient_ID)
        REFERENCES Patients(Patient_ID)
);
-- ============================================
-- Insert Data into Departments
-- ============================================

INSERT INTO Departments (Department_ID, Department_Name) VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics'),
(4, 'Pediatrics'),
(5, 'Dermatology'),
(6, 'General Medicine'),
(7, 'ENT'),
(8, 'Gynecology');
SELECT * FROM Departments;
-- ============================================
-- Insert Data into Doctors
-- ============================================

INSERT INTO Doctors (Doctor_ID, Doctor_Name, Department_ID, Experience_Years, Consultation_Fee) VALUES
(101, 'Dr. Arjun Sharma', 1, 15, 1000.00),
(102, 'Dr. Priya Nair', 1, 10, 900.00),
(103, 'Dr. Rahul Verma', 2, 12, 950.00),
(104, 'Dr. Sneha Iyer', 2, 8, 850.00),
(105, 'Dr. Vikram Singh', 3, 18, 1200.00),
(106, 'Dr. Meera Joshi', 3, 9, 900.00),
(107, 'Dr. Karan Patel', 4, 11, 800.00),
(108, 'Dr. Anjali Rao', 4, 7, 750.00),
(109, 'Dr. Rohan Gupta', 5, 13, 950.00),
(110, 'Dr. Kavya Menon', 5, 6, 800.00),
(111, 'Dr. Aditya Kumar', 6, 20, 1100.00),
(112, 'Dr. Neha Reddy', 6, 14, 950.00),
(113, 'Dr. Suresh Babu', 7, 16, 1000.00),
(114, 'Dr. Pooja Shah', 7, 5, 700.00),
(115, 'Dr. Amit Desai', 8, 17, 1200.00),
(116, 'Dr. Divya Krishnan', 8, 10, 950.00),
(117, 'Dr. Nitin Malhotra', 6, 9, 850.00),
(118, 'Dr. Asha Kapoor', 4, 12, 900.00),
(119, 'Dr. Sanjay Mishra', 3, 21, 1300.00),
(120, 'Dr. Ritu Chawla', 1, 4, 700.00);
SELECT * FROM Doctors;
SELECT COUNT(*) AS Total_Doctors
FROM Doctors;
-- ============================================
-- Insert Data into Patients (Batch 1)
-- ============================================

INSERT INTO Patients (Patient_ID, Patient_Name, Gender, Age, City) VALUES
(1001, 'Aarav Mehta', 'Male', 28, 'Chennai'),
(1002, 'Diya Sharma', 'Female', 35, 'Bangalore'),
(1003, 'Rohan Gupta', 'Male', 42, 'Hyderabad'),
(1004, 'Ananya Iyer', 'Female', 24, 'Chennai'),
(1005, 'Vivaan Patel', 'Male', 31, 'Mumbai'),
(1006, 'Ishita Nair', 'Female', 27, 'Kochi'),
(1007, 'Aditya Singh', 'Male', 39, 'Delhi'),
(1008, 'Meera Joshi', 'Female', 46, 'Pune'),
(1009, 'Arjun Reddy', 'Male', 52, 'Hyderabad'),
(1010, 'Sneha Kapoor', 'Female', 30, 'Jaipur'),
(1011, 'Karthik Raj', 'Male', 26, 'Chennai'),
(1012, 'Priya Verma', 'Female', 33, 'Lucknow'),
(1013, 'Rahul Nair', 'Male', 37, 'Kochi'),
(1014, 'Aisha Khan', 'Female', 29, 'Hyderabad'),
(1015, 'Siddharth Jain', 'Male', 41, 'Indore'),
(1016, 'Neha Agarwal', 'Female', 38, 'Bhopal'),
(1017, 'Harish Kumar', 'Male', 48, 'Coimbatore'),
(1018, 'Pooja Menon', 'Female', 32, 'Trivandrum'),
(1019, 'Varun Das', 'Male', 45, 'Visakhapatnam'),
(1020, 'Kavya Rao', 'Female', 23, 'Mysore'),
(1021, 'Nikhil Soni', 'Male', 34, 'Nagpur'),
(1022, 'Divya Sharma', 'Female', 36, 'Surat'),
(1023, 'Akash Mishra', 'Male', 40, 'Patna'),
(1024, 'Ritika Sen', 'Female', 27, 'Kolkata'),
(1025, 'Manoj Pillai', 'Male', 50, 'Kochi');
SELECT COUNT(*) AS Total_Patients
FROM Patients;
-- ============================================
-- Insert Data into Patients (Batch 2)
-- ============================================

INSERT INTO Patients (Patient_ID, Patient_Name, Gender, Age, City) VALUES
(1026, 'Anjali Desai', 'Female', 31, 'Ahmedabad'),
(1027, 'Rakesh Yadav', 'Male', 44, 'Lucknow'),
(1028, 'Swathi Krishnan', 'Female', 29, 'Chennai'),
(1029, 'Deepak Sharma', 'Male', 36, 'Delhi'),
(1030, 'Nandhini Ravi', 'Female', 34, 'Madurai'),
(1031, 'Gautham Kumar', 'Male', 27, 'Salem'),
(1032, 'Shalini Gupta', 'Female', 41, 'Noida'),
(1033, 'Ajay Verma', 'Male', 38, 'Kanpur'),
(1034, 'Keerthana S', 'Female', 26, 'Chennai'),
(1035, 'Mohit Arora', 'Male', 47, 'Gurgaon'),
(1036, 'Lavanya R', 'Female', 30, 'Coimbatore'),
(1037, 'Sandeep Reddy', 'Male', 43, 'Hyderabad'),
(1038, 'Reshma Thomas', 'Female', 35, 'Kochi'),
(1039, 'Yash Malhotra', 'Male', 25, 'Delhi'),
(1040, 'Bhavya Patel', 'Female', 32, 'Vadodara'),
(1041, 'Kishore Babu', 'Male', 54, 'Vijayawada'),
(1042, 'Anitha Devi', 'Female', 49, 'Tiruchirappalli'),
(1043, 'Tarun Mehta', 'Male', 33, 'Mumbai'),
(1044, 'Sowmya Rao', 'Female', 28, 'Bangalore'),
(1045, 'Naveen Kumar', 'Male', 39, 'Chennai'),
(1046, 'Aparna Nair', 'Female', 37, 'Kochi'),
(1047, 'Rohit Saxena', 'Male', 42, 'Indore'),
(1048, 'Gayathri Iyer', 'Female', 24, 'Chennai'),
(1049, 'Praveen Singh', 'Male', 46, 'Bhopal'),
(1050, 'Shruthi Menon', 'Female', 31, 'Hyderabad');
SELECT COUNT(*) AS Total_Patients
FROM Patients;
SELECT * FROM Patients;
-- ============================================
-- Insert Data into Appointments (Batch 1)
-- ============================================

INSERT INTO Appointments
(Appointment_ID, Patient_ID, Doctor_ID, Appointment_Date, Status)
VALUES
(2001,1001,101,'2025-01-05','Completed'),
(2002,1002,102,'2025-01-06','Completed'),
(2003,1003,103,'2025-01-07','Cancelled'),
(2004,1004,104,'2025-01-08','Completed'),
(2005,1005,105,'2025-01-09','Completed'),
(2006,1006,106,'2025-01-10','No Show'),
(2007,1007,107,'2025-01-11','Completed'),
(2008,1008,108,'2025-01-12','Completed'),
(2009,1009,109,'2025-01-13','Completed'),
(2010,1010,110,'2025-01-14','Cancelled'),
(2011,1011,111,'2025-01-15','Completed'),
(2012,1012,112,'2025-01-16','Completed'),
(2013,1013,113,'2025-01-17','Completed'),
(2014,1014,114,'2025-01-18','No Show'),
(2015,1015,115,'2025-01-19','Completed'),
(2016,1016,116,'2025-01-20','Completed'),
(2017,1017,117,'2025-01-21','Completed'),
(2018,1018,118,'2025-01-22','Cancelled'),
(2019,1019,119,'2025-01-23','Completed'),
(2020,1020,120,'2025-01-24','Completed'),
(2021,1021,101,'2025-01-25','Completed'),
(2022,1022,102,'2025-01-26','Completed'),
(2023,1023,103,'2025-01-27','Completed'),
(2024,1024,104,'2025-01-28','No Show'),
(2025,1025,105,'2025-01-29','Completed');
SELECT COUNT(*) AS Total_Appointments
FROM Appointments;
-- ============================================
-- Insert Data into Appointments (Batch 2)
-- ============================================

INSERT INTO Appointments
(Appointment_ID, Patient_ID, Doctor_ID, Appointment_Date, Status)
VALUES
(2026,1026,106,'2025-02-01','Completed'),
(2027,1027,107,'2025-02-02','Completed'),
(2028,1028,108,'2025-02-03','Completed'),
(2029,1029,109,'2025-02-04','Cancelled'),
(2030,1030,110,'2025-02-05','Completed'),
(2031,1031,111,'2025-02-06','Completed'),
(2032,1032,112,'2025-02-07','No Show'),
(2033,1033,113,'2025-02-08','Completed'),
(2034,1034,114,'2025-02-09','Completed'),
(2035,1035,115,'2025-02-10','Completed'),
(2036,1036,116,'2025-02-11','Completed'),
(2037,1037,117,'2025-02-12','Cancelled'),
(2038,1038,118,'2025-02-13','Completed'),
(2039,1039,119,'2025-02-14','Completed'),
(2040,1040,120,'2025-02-15','Completed'),
(2041,1041,101,'2025-02-16','No Show'),
(2042,1042,102,'2025-02-17','Completed'),
(2043,1043,103,'2025-02-18','Completed'),
(2044,1044,104,'2025-02-19','Completed'),
(2045,1045,105,'2025-02-20','Completed'),
(2046,1046,106,'2025-02-21','Cancelled'),
(2047,1047,107,'2025-02-22','Completed'),
(2048,1048,108,'2025-02-23','Completed'),
(2049,1049,109,'2025-02-24','Completed'),
(2050,1050,110,'2025-02-25','Completed');
SELECT COUNT(*) AS Total_Appointments
FROM Appointments;
-- ============================================
-- Insert Data into Appointments (Batch 3)
-- ============================================

INSERT INTO Appointments
(Appointment_ID, Patient_ID, Doctor_ID, Appointment_Date, Status)
VALUES
(2051,1001,111,'2025-03-01','Completed'),
(2052,1002,112,'2025-03-02','Completed'),
(2053,1003,113,'2025-03-03','Cancelled'),
(2054,1004,114,'2025-03-04','Completed'),
(2055,1005,115,'2025-03-05','Completed'),
(2056,1006,116,'2025-03-06','Completed'),
(2057,1007,117,'2025-03-07','No Show'),
(2058,1008,118,'2025-03-08','Completed'),
(2059,1009,119,'2025-03-09','Completed'),
(2060,1010,120,'2025-03-10','Completed'),
(2061,1011,101,'2025-03-12','Completed'),
(2062,1012,102,'2025-03-14','Cancelled'),
(2063,1013,103,'2025-03-16','Completed'),
(2064,1014,104,'2025-03-18','Completed'),
(2065,1015,105,'2025-03-20','Completed'),
(2066,1016,106,'2025-04-01','Completed'),
(2067,1017,107,'2025-04-03','No Show'),
(2068,1018,108,'2025-04-05','Completed'),
(2069,1019,109,'2025-04-07','Completed'),
(2070,1020,110,'2025-04-09','Completed'),
(2071,1021,111,'2025-04-11','Completed'),
(2072,1022,112,'2025-04-13','Cancelled'),
(2073,1023,113,'2025-04-15','Completed'),
(2074,1024,114,'2025-04-17','Completed'),
(2075,1025,115,'2025-04-19','Completed');
SELECT COUNT(*) AS Total_Appointments
FROM Appointments;
SELECT COUNT(*) AS Total_Appointments
FROM Appointments;
SELECT COUNT(*) AS Total_Appointments
FROM Appointments;
-- ============================================
-- Insert Data into Treatments (Batch 1)
-- ============================================

INSERT INTO Treatments
(Treatment_ID, Appointment_ID, Treatment_Name, Treatment_Cost)
VALUES
(3001,2001,'ECG',1500.00),
(3002,2002,'Heart Checkup',2500.00),
(3003,2003,'Brain MRI',6500.00),
(3004,2004,'Neurological Consultation',1800.00),
(3005,2005,'Knee X-Ray',2200.00),
(3006,2006,'Physiotherapy',2000.00),
(3007,2007,'Child Vaccination',1200.00),
(3008,2008,'General Checkup',800.00),
(3009,2009,'Skin Allergy Test',1700.00),
(3010,2010,'Acne Treatment',2500.00),
(3011,2011,'Blood Test',900.00),
(3012,2012,'Diabetes Checkup',1600.00),
(3013,2013,'ENT Examination',1100.00),
(3014,2014,'Ear Cleaning',700.00),
(3015,2015,'Pregnancy Scan',3200.00),
(3016,2016,'Ultrasound',2800.00),
(3017,2017,'General Consultation',600.00),
(3018,2018,'ECG',1500.00),
(3019,2019,'Hip Replacement Consultation',4500.00),
(3020,2020,'Skin Infection Treatment',2100.00),
(3021,2021,'Blood Pressure Check',500.00),
(3022,2022,'General Checkup',800.00),
(3023,2023,'Sinus Treatment',1800.00),
(3024,2024,'Child Health Checkup',1000.00),
(3025,2025,'Bone Density Scan',2700.00);
SELECT COUNT(*) AS Total_Treatments
FROM Treatments;
SELECT * FROM Treatments;
-- ============================================
-- Insert Data into Treatments (Batch 2)
-- ============================================

INSERT INTO Treatments
(Treatment_ID, Appointment_ID, Treatment_Name, Treatment_Cost)
VALUES
(3026,2026,'Eye Examination',900.00),
(3027,2027,'Asthma Checkup',1400.00),
(3028,2028,'Child Vaccination',1300.00),
(3029,2029,'Skin Infection Treatment',2200.00),
(3030,2030,'Thyroid Test',1800.00),
(3031,2031,'General Consultation',700.00),
(3032,2032,'Cholesterol Test',1200.00),
(3033,2033,'Hearing Test',1500.00),
(3034,2034,'Ear Infection Treatment',1700.00),
(3035,2035,'Pregnancy Checkup',2800.00),
(3036,2036,'Ultrasound',3000.00),
(3037,2037,'Blood Sugar Test',900.00),
(3038,2038,'ECG',1600.00),
(3039,2039,'CT Scan',5500.00),
(3040,2040,'Skin Allergy Test',1800.00),
(3041,2041,'Blood Pressure Check',600.00),
(3042,2042,'Diabetes Checkup',1700.00),
(3043,2043,'Sinus Treatment',1900.00),
(3044,2044,'Child Health Checkup',1100.00),
(3045,2045,'Bone Fracture Consultation',3500.00),
(3046,2046,'Physiotherapy',2200.00),
(3047,2047,'Heart Checkup',2600.00),
(3048,2048,'Eye Examination',900.00),
(3049,2049,'MRI Scan',7000.00),
(3050,2050,'General Checkup',800.00);
SELECT COUNT(*) AS Total_Treatments
FROM Treatments;
-- ============================================
-- Insert Data into Treatments (Batch 3)
-- ============================================

INSERT INTO Treatments
(Treatment_ID, Appointment_ID, Treatment_Name, Treatment_Cost)
VALUES
(3051,2051,'Cardiac Screening',2800.00),
(3052,2052,'Blood Test',950.00),
(3053,2053,'Brain CT Scan',6000.00),
(3054,2054,'Migraine Consultation',1600.00),
(3055,2055,'Joint Pain Evaluation',2400.00),
(3056,2056,'Physiotherapy',2100.00),
(3057,2057,'Child Vaccination',1300.00),
(3058,2058,'Pediatric Consultation',1000.00),
(3059,2059,'Skin Allergy Test',1750.00),
(3060,2060,'Acne Treatment',2600.00),
(3061,2061,'Diabetes Checkup',1650.00),
(3062,2062,'Blood Pressure Check',550.00),
(3063,2063,'ENT Examination',1200.00),
(3064,2064,'Hearing Assessment',1800.00),
(3065,2065,'Pregnancy Ultrasound',3500.00),
(3066,2066,'Ultrasound Scan',2900.00),
(3067,2067,'General Consultation',700.00),
(3068,2068,'Eye Examination',900.00),
(3069,2069,'Fracture Follow-up',2000.00),
(3070,2070,'Skin Infection Treatment',2200.00),
(3071,2071,'Cholesterol Test',1250.00),
(3072,2072,'General Checkup',850.00),
(3073,2073,'Sinus Consultation',1850.00),
(3074,2074,'Child Growth Assessment',1400.00),
(3075,2075,'Bone Density Scan',3000.00);
SELECT COUNT(*) AS Total_Treatments
FROM Treatments;
-- ============================================
-- Insert Data into Treatments (Batch 4)
-- ============================================

INSERT INTO Treatments
(Treatment_ID, Appointment_ID, Treatment_Name, Treatment_Cost)
VALUES
(3076,2076,'Eye Checkup',850.00),
(3077,2077,'Asthma Evaluation',1600.00),
(3078,2078,'Child Vaccination',1250.00),
(3079,2079,'Dermatology Consultation',1900.00),
(3080,2080,'Thyroid Function Test',2000.00),
(3081,2081,'General Consultation',700.00),
(3082,2082,'Blood Sugar Test',950.00),
(3083,2083,'ENT Consultation',1300.00),
(3084,2084,'Ear Infection Treatment',1750.00),
(3085,2085,'Pregnancy Checkup',3000.00),
(3086,2086,'Ultrasound',3200.00),
(3087,2087,'Cardiac Screening',2900.00),
(3088,2088,'Eye Examination',950.00),
(3089,2089,'MRI Scan',7200.00),
(3090,2090,'Skin Allergy Test',1850.00),
(3091,2091,'Blood Pressure Check',600.00),
(3092,2092,'Diabetes Checkup',1700.00),
(3093,2093,'Sinus Treatment',1950.00),
(3094,2094,'Child Health Checkup',1200.00),
(3095,2095,'Bone Fracture Consultation',3600.00),
(3096,2096,'Physiotherapy',2300.00),
(3097,2097,'Heart Checkup',2700.00),
(3098,2098,'General Checkup',850.00),
(3099,2099,'CT Scan',5800.00),
(3100,2100,'Full Body Health Check',4500.00);
SELECT COUNT(*) AS Total_Treatments
FROM Treatments;
-- ============================================
-- Insert Data into Bills (Batch 1)
-- ============================================

INSERT INTO Bills
(Bill_ID, Appointment_ID, Total_Amount, Payment_Status)
VALUES
(4001,2001,2500.00,'Paid'),
(4002,2002,3400.00,'Paid'),
(4003,2003,7200.00,'Pending'),
(4004,2004,2600.00,'Paid'),
(4005,2005,3800.00,'Paid'),
(4006,2006,2900.00,'Pending'),
(4007,2007,2000.00,'Paid'),
(4008,2008,1500.00,'Paid'),
(4009,2009,2700.00,'Paid'),
(4010,2010,3300.00,'Pending'),
(4011,2011,1800.00,'Paid'),
(4012,2012,2500.00,'Paid'),
(4013,2013,2100.00,'Paid'),
(4014,2014,1400.00,'Pending'),
(4015,2015,4500.00,'Paid'),
(4016,2016,3900.00,'Paid'),
(4017,2017,1300.00,'Paid'),
(4018,2018,2500.00,'Pending'),
(4019,2019,6000.00,'Paid'),
(4020,2020,3000.00,'Paid'),
(4021,2021,1200.00,'Paid'),
(4022,2022,1600.00,'Paid'),
(4023,2023,2800.00,'Paid'),
(4024,2024,1700.00,'Pending'),
(4025,2025,4200.00,'Paid');
SELECT COUNT(*) AS Total_Bills
FROM Bills;
-- ============================================
-- Insert Data into Bills (Batch 2)
-- ============================================
INSERT INTO Bills
(Bill_ID, Appointment_ID, Total_Amount, Payment_Status)
VALUES
(4026,2026,1800.00,'Paid'),
(4027,2027,2400.00,'Paid'),
(4028,2028,1900.00,'Paid'),
(4029,2029,3100.00,'Pending'),
(4030,2030,2600.00,'Paid'),
(4031,2031,1500.00,'Paid'),
(4032,2032,2200.00,'Pending'),
(4033,2033,2500.00,'Paid'),
(4034,2034,2800.00,'Paid'),
(4035,2035,4200.00,'Paid'),
(4036,2036,3900.00,'Paid'),
(4037,2037,1600.00,'Pending'),
(4038,2038,2700.00,'Paid'),
(4039,2039,7500.00,'Paid'),
(4040,2040,2900.00,'Paid'),
(4041,2041,1200.00,'Pending'),
(4042,2042,2300.00,'Paid'),
(4043,2043,2600.00,'Paid'),
(4044,2044,1800.00,'Paid'),
(4045,2045,5000.00,'Paid'),
(4046,2046,3100.00,'Pending'),
(4047,2047,3600.00,'Paid'),
(4048,2048,1700.00,'Paid'),
(4049,2049,7800.00,'Paid'),
(4050,2050,1400.00,'Paid');
SELECT COUNT(*) AS Total_Bills
FROM Bills;
-- ============================================
-- Insert Data into Bills (Batch 3)
-- ============================================

INSERT INTO Bills
(Bill_ID, Appointment_ID, Total_Amount, Payment_Status)
VALUES
(4051,2051,3500.00,'Paid'),
(4052,2052,1800.00,'Paid'),
(4053,2053,8200.00,'Pending'),
(4054,2054,2400.00,'Paid'),
(4055,2055,3000.00,'Paid'),
(4056,2056,2900.00,'Paid'),
(4057,2057,1700.00,'Pending'),
(4058,2058,1600.00,'Paid'),
(4059,2059,2600.00,'Paid'),
(4060,2060,3400.00,'Paid'),
(4061,2061,2100.00,'Paid'),
(4062,2062,1300.00,'Pending'),
(4063,2063,1900.00,'Paid'),
(4064,2064,2500.00,'Paid'),
(4065,2065,4800.00,'Paid'),
(4066,2066,4100.00,'Paid'),
(4067,2067,1500.00,'Pending'),
(4068,2068,1700.00,'Paid'),
(4069,2069,2900.00,'Paid'),
(4070,2070,3100.00,'Paid'),
(4071,2071,1800.00,'Paid'),
(4072,2072,1400.00,'Pending'),
(4073,2073,2600.00,'Paid'),
(4074,2074,2000.00,'Paid'),
(4075,2075,4300.00,'Paid');
SELECT COUNT(*) AS Total_Bills
FROM Bills;
-- ============================================
-- Insert Data into Bills (Batch 4)
-- ============================================

INSERT INTO Bills
(Bill_ID, Appointment_ID, Total_Amount, Payment_Status)
VALUES
(4076,2076,1800.00,'Paid'),
(4077,2077,2600.00,'Paid'),
(4078,2078,1700.00,'Pending'),
(4079,2079,3000.00,'Paid'),
(4080,2080,2800.00,'Paid'),
(4081,2081,1400.00,'Paid'),
(4082,2082,1900.00,'Pending'),
(4083,2083,2200.00,'Paid'),
(4084,2084,2600.00,'Paid'),
(4085,2085,4700.00,'Paid'),
(4086,2086,3900.00,'Pending'),
(4087,2087,3600.00,'Paid'),
(4088,2088,1600.00,'Paid'),
(4089,2089,7900.00,'Paid'),
(4090,2090,2500.00,'Paid'),
(4091,2091,1200.00,'Paid'),
(4092,2092,2300.00,'Pending'),
(4093,2093,2700.00,'Paid'),
(4094,2094,1800.00,'Paid'),
(4095,2095,5200.00,'Paid'),
(4096,2096,3400.00,'Paid'),
(4097,2097,3100.00,'Pending'),
(4098,2098,1500.00,'Paid'),
(4099,2099,6100.00,'Paid'),
(4100,2100,5000.00,'Paid');
SELECT COUNT(*) AS Total_Bills
FROM Bills;
-- ============================================
-- Insert Data into Insurance (Batch 1)
-- ============================================
INSERT INTO Insurance
(Insurance_ID, Patient_ID, Provider, Coverage_Percentage)
VALUES
(5001,1001,'Star Health',80),
(5002,1002,'Niva Bupa',90),
(5003,1003,'HDFC ERGO',75),
(5004,1004,'ICICI Lombard',85),
(5005,1005,'Care Health',70),
(5006,1006,'Tata AIG',90),
(5007,1007,'Aditya Birla Health',80),
(5008,1008,'Reliance General',75),
(5009,1009,'Star Health',85),
(5010,1010,'Niva Bupa',80),
(5011,1011,'HDFC ERGO',90),
(5012,1012,'ICICI Lombard',75),
(5013,1013,'Care Health',85),
(5014,1014,'Tata AIG',80),
(5015,1015,'Star Health',90),
(5016,1016,'Niva Bupa',70),
(5017,1017,'Reliance General',80),
(5018,1018,'Aditya Birla Health',85),
(5019,1019,'Care Health',75),
(5020,1020,'ICICI Lombard',90),
(5021,1021,'Star Health',80),
(5022,1022,'HDFC ERGO',85),
(5023,1023,'Niva Bupa',75),
(5024,1024,'Tata AIG',90),
(5025,1025,'Care Health',80);
SELECT COUNT(*) AS Total_Insurance
FROM Insurance;
-- ============================================
-- Insert Data into Insurance (Batch 2)
-- ============================================
INSERT INTO Insurance
(Insurance_ID, Patient_ID, Provider, Coverage_Percentage)
VALUES
(5026,1026,'HDFC ERGO',85),
(5027,1027,'ICICI Lombard',80),
(5028,1028,'Star Health',90),
(5029,1029,'Care Health',75),
(5030,1030,'Niva Bupa',85),
(5031,1031,'Reliance General',70),
(5032,1032,'Tata AIG',80),
(5033,1033,'Aditya Birla Health',90),
(5034,1034,'Star Health',75),
(5035,1035,'HDFC ERGO',85),
(5036,1036,'Care Health',80),
(5037,1037,'ICICI Lombard',90),
(5038,1038,'Niva Bupa',75),
(5039,1039,'Reliance General',85),
(5040,1040,'Star Health',80),
(5041,1041,'Tata AIG',90),
(5042,1042,'Care Health',75),
(5043,1043,'HDFC ERGO',80),
(5044,1044,'Aditya Birla Health',85),
(5045,1045,'ICICI Lombard',70),
(5046,1046,'Niva Bupa',90),
(5047,1047,'Star Health',80),
(5048,1048,'Care Health',85),
(5049,1049,'Reliance General',75),
(5050,1050,'Tata AIG',90);
SELECT COUNT(*) AS Total_Insurance
FROM Insurance;
-- ============================================
-- Insert Data into Medicines
-- ============================================

INSERT INTO Medicines
(Medicine_ID, Treatment_ID, Medicine_Name, Quantity)
VALUES
(6001,3001,'Aspirin',10),
(6002,3002,'Atorvastatin',30),
(6003,3003,'Mannitol',5),
(6004,3004,'Sumatriptan',10),
(6005,3005,'Calcium Tablets',20),
(6006,3006,'Ibuprofen',15),
(6007,3007,'Paracetamol Syrup',2),
(6008,3008,'Vitamin C',20),
(6009,3009,'Cetirizine',10),
(6010,3010,'Clindamycin Gel',1),
(6011,3011,'Iron Tablets',30),
(6012,3012,'Metformin',30),
(6013,3013,'Amoxicillin',14),
(6014,3014,'Ear Drops',1),
(6015,3015,'Folic Acid',30),
(6016,3016,'Vitamin D',10),
(6017,3017,'Paracetamol',15),
(6018,3018,'Aspirin',10),
(6019,3019,'Diclofenac',10),
(6020,3020,'Hydrocortisone Cream',1),
(6021,3021,'Amlodipine',30),
(6022,3022,'Multivitamin',30),
(6023,3023,'Azithromycin',6),
(6024,3024,'Vitamin Syrup',1),
(6025,3025,'Calcium Tablets',20);
SELECT COUNT(*) AS Total_Medicines
FROM Medicines;
SELECT * FROM Medicines;
-- ============================================
-- Query 1: Display all departments
-- ============================================

SELECT *
FROM Departments;
-- ============================================
-- Query 2: Display all doctors
-- ============================================

SELECT *
FROM Doctors;
-- ============================================
-- Query 3: Display all patients
-- ============================================

SELECT *
FROM Patients;
-- ============================================
-- Query 4: Completed appointments
-- ============================================

SELECT *
FROM Appointments
WHERE Status = 'Completed';
-- ============================================
-- Query 5: Pending bills
-- ============================================

SELECT *
FROM Bills
WHERE Payment_Status = 'Pending';
-- ============================================
-- Query 6: Experienced doctors
-- ============================================

SELECT *
FROM Doctors
WHERE Experience_Years > 10;
-- ============================================
-- Query 7: Patients above 40 years
-- ============================================

SELECT *
FROM Patients
WHERE Age > 40;
-- ============================================
-- Query 8: Expensive treatments
-- ============================================

SELECT *
FROM Treatments
WHERE Treatment_Cost > 3000;
-- ============================================
-- Query 9: Doctors by consultation fee
-- ============================================

SELECT *
FROM Doctors
ORDER BY Consultation_Fee DESC;
-- ============================================
-- Query 10: Patients by age
-- ============================================

SELECT *
FROM Patients
ORDER BY Age DESC;
-- ============================================
-- Query 11: Total Patients
-- ============================================

SELECT COUNT(*) AS Total_Patients
FROM Patients;
-- ============================================
-- Query 12: Total Doctors
-- ============================================

SELECT COUNT(*) AS Total_Doctors
FROM Doctors;
-- ============================================
-- Query 13: Total Appointments
-- ============================================

SELECT COUNT(*) AS Total_Appointments
FROM Appointments;
-- ============================================
-- Query 14: Total Revenue
-- ============================================

SELECT SUM(Total_Amount) AS Total_Revenue
FROM Bills;
-- ============================================
-- Query 15: Average Treatment Cost
-- ============================================

SELECT AVG(Treatment_Cost) AS Average_Treatment_Cost
FROM Treatments;
-- ============================================
-- Query 16: Highest Treatment Cost
-- ============================================

SELECT MAX(Treatment_Cost) AS Highest_Treatment_Cost
FROM Treatments;
-- ============================================
-- Query 17: Lowest Treatment Cost
-- ============================================

SELECT MIN(Treatment_Cost) AS Lowest_Treatment_Cost
FROM Treatments;
-- ============================================
-- Query 18: Average Consultation Fee
-- ============================================

SELECT AVG(Consultation_Fee) AS Average_Consultation_Fee
FROM Doctors;
-- ============================================
-- Query 19: Bills by Payment Status
-- ============================================

SELECT Payment_Status,
       COUNT(*) AS Total_Bills
FROM Bills
GROUP BY Payment_Status;
-- ============================================
-- Query 20: Appointments by Status
-- ============================================

SELECT Status,
       COUNT(*) AS Total_Appointments
FROM Appointments
GROUP BY Status;
-- ============================================
-- Query 21: Patients by City
-- ============================================

SELECT City,
       COUNT(*) AS Total_Patients
FROM Patients
GROUP BY City
ORDER BY Total_Patients DESC;
-- ============================================
-- Query 22: Doctors by Department
-- ============================================

SELECT d.Department_Name,
       COUNT(doc.Doctor_ID) AS Total_Doctors
FROM Departments d
JOIN Doctors doc
ON d.Department_ID = doc.Department_ID
GROUP BY d.Department_Name
ORDER BY Total_Doctors DESC;
-- ============================================
-- Query 23: Appointments per Doctor
-- ============================================

SELECT d.Doctor_Name,
       COUNT(a.Appointment_ID) AS Total_Appointments
FROM Doctors d
JOIN Appointments a
ON d.Doctor_ID = a.Doctor_ID
GROUP BY d.Doctor_Name
ORDER BY Total_Appointments DESC;
-- ============================================
-- Query 24: Doctors with More Than 5 Appointments
-- ============================================

SELECT d.Doctor_Name,
       COUNT(a.Appointment_ID) AS Total_Appointments
FROM Doctors d
JOIN Appointments a
ON d.Doctor_ID = a.Doctor_ID
GROUP BY d.Doctor_Name
HAVING COUNT(a.Appointment_ID) > 5
ORDER BY Total_Appointments DESC;
-- ============================================
-- Query 25: Revenue by Doctor
-- ============================================

SELECT d.Doctor_Name,
       SUM(b.Total_Amount) AS Total_Revenue
FROM Doctors d
JOIN Appointments a
ON d.Doctor_ID = a.Doctor_ID
JOIN Bills b
ON a.Appointment_ID = b.Appointment_ID
GROUP BY d.Doctor_Name
ORDER BY Total_Revenue DESC;
-- ============================================
-- Query 26: Revenue by Department
-- ============================================

SELECT dep.Department_Name,
       SUM(b.Total_Amount) AS Total_Revenue
FROM Departments dep
JOIN Doctors d
ON dep.Department_ID = d.Department_ID
JOIN Appointments a
ON d.Doctor_ID = a.Doctor_ID
JOIN Bills b
ON a.Appointment_ID = b.Appointment_ID
GROUP BY dep.Department_Name
ORDER BY Total_Revenue DESC;
-- ============================================
-- Query 27: Average Treatment Cost
-- ============================================

SELECT Treatment_Name,
       AVG(Treatment_Cost) AS Average_Cost
FROM Treatments
GROUP BY Treatment_Name
ORDER BY Average_Cost DESC;
-- ============================================
-- Query 28: Patients and Insurance
-- ============================================

SELECT p.Patient_Name,
       i.Provider,
       i.Coverage_Percentage
FROM Patients p
JOIN Insurance i
ON p.Patient_ID = i.Patient_ID;
-- ============================================
-- Query 29: Insurance Provider Analysis
-- ============================================

SELECT Provider,
       COUNT(*) AS Total_Patients
FROM Insurance
GROUP BY Provider
ORDER BY Total_Patients DESC;
-- ============================================
-- Query 30: Revenue by Payment Status
-- ============================================

SELECT Payment_Status,
       SUM(Total_Amount) AS Total_Revenue
FROM Bills
GROUP BY Payment_Status;
-- ============================================
-- Query 31: Patients Older Than Average Age
-- ============================================

SELECT Patient_Name,
       Age
FROM Patients
WHERE Age > (
    SELECT AVG(Age)
    FROM Patients
);
-- ============================================
-- Query 32: Doctors Above Average Fee
-- ============================================
SELECT Doctor_Name,
       Consultation_Fee
FROM Doctors
WHERE Consultation_Fee >
(
    SELECT AVG(Consultation_Fee)
    FROM Doctors
);
-- ============================================
-- Query 33: Bill Category
-- ============================================

SELECT Bill_ID,
       Total_Amount,
       CASE
           WHEN Total_Amount >= 5000 THEN 'High Bill'
           WHEN Total_Amount >= 3000 THEN 'Medium Bill'
           ELSE 'Low Bill'
       END AS Bill_Category
FROM Bills;
-- ============================================
-- Query 34: Patient Age Group
-- ============================================

SELECT Patient_Name,
       Age,
       CASE
           WHEN Age < 18 THEN 'Child'
           WHEN Age BETWEEN 18 AND 40 THEN 'Adult'
           ELSE 'Senior'
       END AS Age_Group
FROM Patients;
-- ============================================
-- Query 35: CTE Revenue by Doctor
-- ============================================

WITH DoctorRevenue AS
(
    SELECT
        d.Doctor_Name,
        SUM(b.Total_Amount) AS Revenue
    FROM Doctors d
    JOIN Appointments a
        ON d.Doctor_ID = a.Doctor_ID
    JOIN Bills b
        ON a.Appointment_ID = b.Appointment_ID
    GROUP BY d.Doctor_Name
)

SELECT *
FROM DoctorRevenue
ORDER BY Revenue DESC;
-- ============================================
-- Query 36: ROW_NUMBER Example
-- ============================================

SELECT
    d.Doctor_Name,
    SUM(b.Total_Amount) AS Revenue,

    ROW_NUMBER() OVER(
        ORDER BY SUM(b.Total_Amount) DESC
    ) AS Row_Num

FROM Doctors d
JOIN Appointments a
ON d.Doctor_ID = a.Doctor_ID
JOIN Bills b
ON a.Appointment_ID = b.Appointment_ID

GROUP BY d.Doctor_Name;
-- ============================================
-- Query 37: RANK Example
-- ============================================

SELECT
    d.Doctor_Name,
    SUM(b.Total_Amount) AS Revenue,

    RANK() OVER(
        ORDER BY SUM(b.Total_Amount) DESC
    ) AS Doctor_Rank

FROM Doctors d
JOIN Appointments a
ON d.Doctor_ID = a.Doctor_ID
JOIN Bills b
ON a.Appointment_ID = b.Appointment_ID

GROUP BY d.Doctor_Name;
-- ============================================
-- Query 38: DENSE_RANK Example
-- ============================================

SELECT
    d.Doctor_Name,
    SUM(b.Total_Amount) AS Revenue,

    DENSE_RANK() OVER(
        ORDER BY SUM(b.Total_Amount) DESC
    ) AS Doctor_Rank

FROM Doctors d
JOIN Appointments a
ON d.Doctor_ID = a.Doctor_ID
JOIN Bills b
ON a.Appointment_ID = b.Appointment_ID

GROUP BY d.Doctor_Name;
-- ============================================
-- Query 39: Top 5 Doctors
-- ============================================
SELECT
    d.Doctor_Name,
    SUM(b.Total_Amount) AS Revenue

FROM Doctors d
JOIN Appointments a
ON d.Doctor_ID = a.Doctor_ID
JOIN Bills b
ON a.Appointment_ID = b.Appointment_ID

GROUP BY d.Doctor_Name

ORDER BY Revenue DESC

LIMIT 5;
-- ============================================
-- Query 40: Top 5 Costliest Treatments
-- ============================================

SELECT
    Treatment_Name,
    Treatment_Cost
FROM Treatments

ORDER BY Treatment_Cost DESC

LIMIT 5;
SELECT * FROM Medicines;
