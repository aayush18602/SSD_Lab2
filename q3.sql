DELIMITER //
CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE new_id INT;
    IF NOT EXISTS (SELECT 1 FROM Subscribers WHERE SubscriberName = subName) THEN
        SELECT IFNULL(MAX(SubscriberID), 0) + 1 INTO new_id FROM Subscribers;
        INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate)
        VALUES (new_id, subName, CURDATE());
    END IF;
END //
DELIMITER ;