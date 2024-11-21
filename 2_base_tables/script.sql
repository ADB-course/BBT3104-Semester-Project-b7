CREATE TABLE `QualityCheck` (
  `CheckID` int NOT NULL AUTO_INCREMENT,
  `BatchID` int NOT NULL,
  `CheckDate` date NOT NULL,
  `Result` varchar(50) NOT NULL,
  `DefectDetails` text,
  PRIMARY KEY (`CheckID`),
  KEY `BatchID` (`BatchID`),
  CONSTRAINT `qualitycheck_ibfk_1` FOREIGN KEY (`BatchID`) REFERENCES `ProductionBatch` (`BatchID`)
) ENGINE=InnoDB
CREATE TABLE `RawMaterial` (
  `MaterialID` int NOT NULL AUTO_INCREMENT,
  `MaterialName` varchar(100) NOT NULL,
  `QuantityOnHand` int NOT NULL,
  `SupplierID` int NOT NULL,
  `ReorderLevel` int NOT NULL,
  `PricePerUnit` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`MaterialID`),
  KEY `MaterialName` (`MaterialName`),
  KEY `SupplierID` (`SupplierID`),
  CONSTRAINT `rawmaterial_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `Supplier` (`SupplierID`)
) ENGINE=InnoDB
CREATE TABLE `Supplier` (
  `SupplierID` int NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(100) NOT NULL,
  `ContactInfo` varchar(255) DEFAULT NULL,
  `DeliveryPerformance` varchar(50) DEFAULT NULL,
  `PaymentTerms` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`),
  KEY `SupplierName` (`SupplierName`)
) ENGINE=InnoDB
CREATE TABLE `Inventory` (
  `InventoryID` int NOT NULL AUTO_INCREMENT,
  `MaterialID` int NOT NULL,
  `StockLevel` int NOT NULL,
  `LastUpdated` datetime NOT NULL,
  `Location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`InventoryID`),
  KEY `MaterialID` (`MaterialID`),
  KEY `Location` (`Location`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`MaterialID`) REFERENCES `RawMaterial` (`MaterialID`)
) ENGINE=InnoDB
CREATE TABLE `Employee` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `Department` varchar(50) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `Name` (`Name`),
  KEY `Department` (`Department`)
) ENGINE=InnoDB
-- Write your SQL code here
