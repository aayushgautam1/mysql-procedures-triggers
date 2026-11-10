-- Task 1a: Stored Procedure for maintaining statistic_tmp table
-- This procedure calculates the total students per city and inserts/updates the statistic_tmp table.
DELIMITER //

CREATE PROCEDURE UpdateCityStatistics()
BEGIN
    INSERT INTO statistic_tmp (city_id, student_count)
    SELECT city_id, COUNT(id)
    FROM student
    WHERE city_id IS NOT NULL
    GROUP BY city_id
    ON DUPLICATE KEY UPDATE student_count = VALUES(student_count);
END //

DELIMITER ;
