CREATE TABLE `Inventory_History` (
  `HistoryID` int NOT NULL AUTO_INCREMENT,
  `InventoryID` int NOT NULL,
  `MaterialID` int NOT NULL,
  `Previous_StockLevel` int NOT NULL,
  `Previous_LastUpdated` datetime NOT NULL,
  `Previous_Location` varchar(100) DEFAULT NULL,
  `New_StockLevel` int NOT NULL,
  `New_LastUpdated` datetime NOT NULL,
  `New_Location` varchar(100) DEFAULT NULL,
  `ChangeTimestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`HistoryID`)
) ENGINE=InnoDB
CREATE TRIGGER TRG_AFTER_UPDATE_ON_Inventory
AFTER UPDATE ON Inventory
FOR EACH ROW
INSERT INTO Inventory_History (
  InventoryID,
  MaterialID,
  StockLevel,
  LastUpdated,
  Location,
  Previous_StockLevel,
  Previous_LastUpdated,
  Previous_Location
)
VALUES (
  OLD.InventoryID,
  OLD.MaterialID,
  OLD.StockLevel,
  OLD.LastUpdated,
  OLD.Location,
  NEW.StockLevel,
  NEW.LastUpdated,
  NEW.Location
);
DELIMITER //
CREATE TRIGGER TRG_BEFORE_INSERT_ProductionBatch
BEFORE INSERT ON ProductionBatch
FOR EACH ROW
BEGIN
 IF NEW.EndDate < NEW.StartDate THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'End Date must be greater than or equal to Start Date';
 END IF;
END//
DELIMITER ;
-- Write your SQL code here
