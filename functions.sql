-- Task 3: Function to format phone numbers
-- This function formats input phone numbers based on their starting digits.
-- Mobile phones (86xxxx) are converted to +3706xxxx.
-- Landlines (85xxxx) are converted to 05xxxx.
DELIMITER //

CREATE FUNCTION FormatPhone(phone_in VARCHAR(28))
RETURNS VARCHAR(28)
DETERMINISTIC
BEGIN
    DECLARE formatted_phone VARCHAR(28);

    -- Check if it is a mobile phone (86xxxx)
    IF phone_in LIKE '86%' THEN
        SET formatted_phone = CONCAT('+3706', SUBSTRING(phone_in, 3));
        
    -- Check if it is a landline (85xxxx)
    ELSEIF phone_in LIKE '85%' THEN
        SET formatted_phone = CONCAT('05', SUBSTRING(phone_in, 3));
        
    -- Keep it the same if it doesn't match either
    ELSE
        SET formatted_phone = phone_in;
    END IF;

    RETURN formatted_phone;
END //

DELIMITER ;
