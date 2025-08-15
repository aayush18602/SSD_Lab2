# Lab 2 SQL Procedures – README

## Steps to Execute

1. Open MySQL Workbench (or MySQL CLI).
2. Execute the provided table creation and data insertion script (tables.sql if you have it) to create and populate the database:
   - CREATE TABLE Shows ...
   - CREATE TABLE Subscribers ...
   - CREATE TABLE WatchHistory ...
   - INSERT INTO Shows ...
   - INSERT INTO Subscribers ...
   - INSERT INTO WatchHistory ...
3. Execute each question’s script in order:
   - SOURCE q1.sql;   -- Creates ListAllSubscribers() procedure
   - SOURCE q2.sql;   -- Creates GetWatchHistoryBySubscriber() procedure
   - SOURCE q3.sql;   -- Creates AddSubscriberIfNotExists() procedure
   - SOURCE q4.sql;   -- Creates SendWatchTimeReport() procedure
   - SOURCE q5.sql;   -- Creates ListAllWatchHistories() procedure

4. To test:
   - CALL ListAllSubscribers();
   - CALL GetWatchHistoryBySubscriber(<subscriber_id>);
   - CALL AddSubscriberIfNotExists('<name>');
   - CALL SendWatchTimeReport();
   - CALL ListAllWatchHistories();

## Notes
- Make sure to run the CREATE TABLE and INSERT statements before executing the procedures.

## Git Repository Link
https://github.com/aayush18602/SSD_Lab2
