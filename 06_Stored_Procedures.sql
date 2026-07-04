USE healthcare_analytics;
-- ============================================
-- Procedure 1: Get Appointments by Doctor
-- ============================================

DELIMITER $$

CREATE PROCEDURE GetDoctorAppointments(IN doctorId INT)
BEGIN

SELECT
    a.Appointment_ID,
    p.Patient_Name,
    a.Appointment_Date,
    a.Status

FROM Appointments a
JOIN Patients p
ON a.Patient_ID = p.Patient_ID

WHERE a.Doctor_ID = doctorId

ORDER BY a.Appointment_Date;

END $$

DELIMITER ;
-- ============================================
-- Procedure 2: Department Revenue
-- ============================================

DELIMITER $$

CREATE PROCEDURE GetDepartmentRevenue(IN deptName VARCHAR(50))
BEGIN

SELECT
    dep.Department_Name,
    SUM(b.Total_Amount) AS Total_Revenue

FROM Departments dep
JOIN Doctors d
ON dep.Department_ID = d.Department_ID
JOIN Appointments a
ON d.Doctor_ID = a.Doctor_ID
JOIN Bills b
ON a.Appointment_ID = b.Appointment_ID

WHERE dep.Department_Name = deptName

GROUP BY dep.Department_Name;

END $$

DELIMITER ;
CALL GetDepartmentRevenue('Cardiology');
-- ============================================
-- Procedure 3: Patients by City
-- ============================================

DELIMITER $$

CREATE PROCEDURE GetPatientsByCity(IN cityName VARCHAR(50))
BEGIN

SELECT
    Patient_ID,
    Patient_Name,
    Age,
    Gender

FROM Patients

WHERE City = cityName

ORDER BY Patient_Name;

END $$

DELIMITER ;
SHOW PROCEDURE STATUS
WHERE Db = 'healthcare_analytics';
CALL GetPatientsByCity('Chennai');
SHOW PROCEDURE STATUS
WHERE Db = 'healthcare_analytics';