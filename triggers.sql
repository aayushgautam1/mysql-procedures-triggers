-- Task 1b: Triggers for automatic execution of UpdateCityStatistics
-- These triggers ensure the statistics remain accurate whenever a record in the student table is inserted, updated, or deleted.

DELIMITER //

-- Trigger for INSERT operations
CREATE TRIGGER after_student_insert
AFTER INSERT ON student
FOR EACH ROW
BEGIN
    CALL UpdateCityStatistics();
END //

-- Trigger for UPDATE operations
CREATE TRIGGER after_student_update
AFTER UPDATE ON student
FOR EACH ROW
BEGIN
    CALL UpdateCityStatistics();
END //

-- Trigger for DELETE operations
CREATE TRIGGER after_student_delete
AFTER DELETE ON student
FOR EACH ROW
BEGIN
    CALL UpdateCityStatistics();
END //

DELIMITER ;
