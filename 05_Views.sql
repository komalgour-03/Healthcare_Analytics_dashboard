-- ============================================
-- View 1: Doctor Revenue Summary
-- ============================================

CREATE VIEW Doctor_Revenue AS

SELECT
    d.Doctor_ID,
    d.Doctor_Name,
    SUM(b.Total_Amount) AS Total_Revenue

FROM Doctors d

JOIN Appointments a
ON d.Doctor_ID = a.Doctor_ID

JOIN Bills b
ON a.Appointment_ID = b.Appointment_ID

GROUP BY
d.Doctor_ID,
d.Doctor_Name;
-- ============================================
-- View 2: Department Performance
-- ============================================

CREATE VIEW Department_Performance AS

SELECT

dep.Department_Name,

COUNT(a.Appointment_ID) AS Total_Appointments,

SUM(b.Total_Amount) AS Revenue

FROM Departments dep

JOIN Doctors d
ON dep.Department_ID=d.Department_ID

JOIN Appointments a
ON d.Doctor_ID=a.Doctor_ID

JOIN Bills b
ON a.Appointment_ID=b.Appointment_ID

GROUP BY dep.Department_Name;
-- ============================================
-- View 3: Patient Appointment Details
-- ============================================

CREATE VIEW Patient_Appointments AS

SELECT

p.Patient_Name,

d.Doctor_Name,

a.Appointment_Date,

a.Status

FROM Patients p

JOIN Appointments a
ON p.Patient_ID=a.Patient_ID

JOIN Doctors d
ON a.Doctor_ID=d.Doctor_ID;
-- ============================================
-- View 4: Insurance Details
-- ============================================

CREATE VIEW Patient_Insurance AS

SELECT

p.Patient_Name,

i.Provider,

i.Coverage_Percentage

FROM Patients p

JOIN Insurance i

ON p.Patient_ID=i.Patient_ID;
-- ============================================
-- View 5: Treatment Details
-- ============================================

CREATE VIEW Treatment_Details AS

SELECT

t.Treatment_Name,

t.Treatment_Cost,

m.Medicine_Name,

m.Quantity

FROM Treatments t

LEFT JOIN Medicines m

ON t.Treatment_ID=m.Treatment_ID;
SELECT * FROM Treatment_Details;
SHOW FULL TABLES
WHERE TABLE_TYPE='VIEW';