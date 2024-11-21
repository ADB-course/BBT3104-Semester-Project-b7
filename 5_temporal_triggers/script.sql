CREATE TABLE employee_archive
  ( ArchiveID INT AUTO_INCREMENT PRIMARY KEY, EmployeeID INT NOT NULL, Name VARCHAR(100),
  Role VARCHAR(50), Department VARCHAR(50),
  ArchiveDate DATETIME NOT NULL ) ENGINE=InnoDB;
CREATE TRIGGER TRG_BEFORE_DELETE_ON_employees
  BEFORE DELETE ON Employee FOR EACH ROW INSERT INTO 
  employee_archive SET EmployeeID = OLD.EmployeeID, Name = OLD.Name,
  Role = OLD.Role, Department = OLD.Department,
  ArchiveDate = CURRENT_TIMESTAMP;
CREATE TABLE `OrderHistory` ( `HistoryID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `PackagingCompletionTime` datetime NOT NULL, 
  PRIMARY KEY (`HistoryID`),
  FOREIGN KEY (`OrderID`)
  REFERENCES `SalesOrder`(`OrderID`) ) ENGINE=InnoDB;
DELIMITER //
  CREATE TRIGGER TRG_AFTER_UPDATE_SalesOrder
  AFTER UPDATE ON SalesOrder 
  FOR EACH ROW BEGIN 
  IF NEW.OrderStatus = 'Packaged' AND OLD.OrderStatus != 'Packaged' 
  THEN INSERT INTO OrderHistory (OrderID, PackagingCompletionTime) 
  VALUES (NEW.OrderID, NOW()); 
END IF;
END // 
DELIMITER ;



-- Write your SQL code here
