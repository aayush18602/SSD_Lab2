DELIMITER //
CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE sub_name VARCHAR(100);
    DECLARE cur CURSOR FOR SELECT SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO sub_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT sub_name AS SubscriberName;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;