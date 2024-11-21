CREATE TABLE `ProductionBatch` (
  `BatchID` int NOT NULL AUTO_INCREMENT,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Volume` decimal(10,2) NOT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`BatchID`),
  CONSTRAINT `productionbatch_chk_1` CHECK ((`EndDate` >= `StartDate`))
INDEX (StartDate),  INDEX (Status)) ENGINE=InnoDB
CREATE TABLE SalesOrder
  ( OrderID INT AUTO_INCREMENT PRIMARY KEY, CustomerID INT NOT NULL, OrderDate DATE NOT NULL,
  TotalAmount DECIMAL(10,2) NOT NULL,CHECK (TotalAmount > 0),
  OrderStatus VARCHAR(20) NOT NULL, INDEX (CustomerID)
  ) ENGINE=InnoDB;


-- Write your SQL code here
