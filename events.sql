-- Task 2: Events for recalculating statistics automatically
-- Note: Ensure the event scheduler is turned on globally (SET GLOBAL event_scheduler = ON;) before creating events.

-- Event for testing (recalculates every 3 minutes)
CREATE EVENT test_statistic_update
ON SCHEDULE EVERY 3 MINUTE
DO
CALL UpdateCityStatistics();

-- Event for final production (recalculates once daily at 3 a.m.)
CREATE EVENT daily_statistic_update
ON SCHEDULE EVERY 1 DAY
STARTS '2026-11-08 03:00:00'
DO
CALL UpdateCityStatistics();
