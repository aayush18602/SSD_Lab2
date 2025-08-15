DELIMITER //
CREATE PROCEDURE ListAllWatchHistories()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE sub_id INT;
    DECLARE sub_name VARCHAR(100);
    DECLARE cur CURSOR FOR SELECT SubscriberID, SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    loop_sub: LOOP
        FETCH cur INTO sub_id, sub_name;
        IF done THEN
            LEAVE loop_sub;
        END IF;

        SELECT CONCAT('Watch history for: ', sub_name) AS Header;
        CALL GetWatchHistoryBySubscriber(sub_id);
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
