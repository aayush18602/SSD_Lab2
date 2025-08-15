DELIMITER //
CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE sub_id INT;
    DECLARE cur CURSOR FOR SELECT SubscriberID FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    loop_subs: LOOP
        FETCH cur INTO sub_id;
        IF done THEN
            LEAVE loop_subs;
        END IF;

        IF EXISTS (SELECT 1 FROM WatchHistory WHERE SubscriberID = sub_id) THEN
            CALL GetWatchHistoryBySubscriber(sub_id);
        END IF;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;