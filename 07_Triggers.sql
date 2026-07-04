USE healthcare_analytics;
-- ============================================
-- Trigger 1: Prevent Negative Treatment Cost
-- ============================================

DELIMITER $$

CREATE TRIGGER trg_check_treatment_cost
BEFORE INSERT ON Treatments
FOR EACH ROW
BEGIN
    IF NEW.Treatment_Cost < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Treatment cost cannot be negative';
    END IF;
END $$

DELIMITER ;
-- ============================================
-- Trigger 2: Prevent Negative Experience
-- ============================================

DELIMITER $$

CREATE TRIGGER trg_check_experience
BEFORE INSERT ON Doctors
FOR EACH ROW
BEGIN
    IF NEW.Experience_Years < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Experience cannot be negative';
    END IF;
END $$

DELIMITER ;
SHOW TRIGGERS;