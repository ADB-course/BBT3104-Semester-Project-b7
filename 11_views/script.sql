CREATE VIEW SupplierInventoryStatus
  AS SELECT s.SupplierID, s.SupplierName, r.MaterialID, r.MaterialName, i.StockLevel, r.ReorderLevel,
  CASE WHEN i.StockLevel <= r.ReorderLevel
  THEN 'Reorder Needed' ELSE 'Sufficient Stock'
  END AS ReorderStatus 
  FROM Supplier s INNER JOIN RawMaterial r ON s.SupplierID = r.SupplierID 
  INNER JOIN Inventory i ON r.MaterialID = i.MaterialID;

CREATE TABLE Customers
  ( CustomerID INT PRIMARY KEY, CustomerName VARCHAR(100),
  ContactInfo VARCHAR(200) );
CREATE VIEW FinancialOrderSummary 
  AS SELECT o.OrderID, 
  c.CustomerID, c.CustomerName, c.ContactInfo, o.OrderDate, 
  o.TotalAmount AS OrderValue, o.OrderStatus AS OrderStatus
  FROM SalesOrder o INNER JOIN Customers c ON o.CustomerID = c.CustomerID;


-- Write your SQL code here
