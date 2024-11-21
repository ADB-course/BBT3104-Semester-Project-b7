START TRANSACTION;
-- Step 1: Deduct inventory levels for materials in the sales order
UPDATE Inventory AS i
INNER JOIN SalesOrderDetails AS sod ON i.MaterialID = sod.MaterialID
SET i.StockLevel = i.StockLevel - sod.Quantity
WHERE sod.OrderID = 1; -- Replace 1 with the actual OrderID
-- Step 2: Check if any inventory level is negative
IF EXISTS (SELECT 1 FROM Inventory WHERE StockLevel < 0) THEN
   ROLLBACK;
   SIGNAL SQLSTATE '45000'
   SET MESSAGE_TEXT = 'Transaction aborted: Insufficient inventory to process the order.';
END IF;
-- Step 3: Update the sales order status to "Completed"
UPDATE SalesOrder
SET OrderStatus = 'Completed'
WHERE OrderID = 1; -- Replace 1 with the actual OrderID
-- Commit the transaction
COMMIT;
-- Write your SQL code here
