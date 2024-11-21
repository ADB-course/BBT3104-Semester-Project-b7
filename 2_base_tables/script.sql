CREATE TABLE QualityCheck
  ( CheckID INT AUTO_INCREMENT PRIMARY KEY, BatchID INT NOT NULL, CheckDate DATE NOT NULL, 
  Result VARCHAR(50) NOT NULL, DefectDetails TEXT,
  INDEX (BatchID), FOREIGN KEY (BatchID) REFERENCES ProductionBatch(BatchID)  )
  ENGINE=InnoDB; 
CREATE TABLE RawMaterial
  ( MaterialID INT AUTO_INCREMENT PRIMARY KEY, MaterialName VARCHAR(100) NOT NULL,
  QuantityOnHand INT NOT NULL, SupplierID INT NOT NULL, 
  ReorderLevel INT NOT NULL, INDEX (MaterialName),
  INDEX (SupplierID),FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID) )
  ENGINE=InnoDB;
CREATE TABLE Supplier
  ( SupplierID INT AUTO_INCREMENT PRIMARY KEY, SupplierName VARCHAR(100) NOT NULL, 
  ContactInfo VARCHAR(255), DeliveryPerformance VARCHAR(50), PaymentTerms VARCHAR(100),
  INDEX (SupplierName) )
  ENGINE=InnoDB;
CREATE TABLE Inventory 
  ( InventoryID INT AUTO_INCREMENT PRIMARY KEY, MaterialID INT NOT NULL,
  StockLevel INT NOT NULL, LastUpdated DATETIME NOT NULL, 
  Location VARCHAR(100),INDEX (MaterialID),INDEX (Location), 
  FOREIGN KEY (MaterialID) REFERENCES RawMaterial(MaterialID) ) 
  ENGINE=InnoDB;
CREATE TABLE Employee 
  ( EmployeeID INT AUTO_INCREMENT PRIMARY KEY, Name VARCHAR(100) NOT NULL,
  Role VARCHAR(50) NOT NULL, Department VARCHAR(50) NOT NULL,
  INDEX (Name),INDEX (Department))
  ENGINE=InnoDB;
CREATE TABLE TrainingRecord 
  ( TrainingRecordID INT AUTO_INCREMENT PRIMARY KEY,
  EmployeeID INT NOT NULL, TrainingDetails TEXT NOT NULL,INDEX (EmployeeID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) ) 
  ENGINE=InnoDB;








-- Write your SQL code here
