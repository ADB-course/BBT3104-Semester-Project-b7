DELIMITER $$

CREATE PROCEDURE `GetSalesOrderSummary`(IN StartDate DATE, IN EndDate DATE, OUT TotalAmount DOUBLE)
BEGIN
    DECLARE totalSales DOUBLE DEFAULT 0.00;
    DECLARE currentStatus VARCHAR(50);
    DECLARE done INT DEFAULT 0;
    
    -- Declare a cursor to iterate through statuses and calculate total sales
    DECLARE salesCursor CURSOR FOR 
        SELECT 
            Status, SUM(Amount) AS TotalAmount
        FROM 
            SalesOrder
        WHERE 
            OrderDate BETWEEN StartDate AND EndDate
        GROUP BY 
            Status;
    
    -- Declare a handler for the cursor completion
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Initialize total sales
    SET TotalAmount = 0.00;

    -- Open the cursor
    OPEN salesCursor;

    read_loop: LOOP
        FETCH salesCursor INTO currentStatus, totalSales;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Add each status's total sales to the output
        SET TotalAmount = TotalAmount + totalSales;
    END LOOP;

    -- Close the cursor
    CLOSE salesCursor;
END $$

DELIMITER ;

DELIMITER $$
  CREATE PROCEDURE `GetProductionReport`( IN StartDate DATE, IN EndDate DATE ) 
  BEGIN SELECT BatchID, StartDate, EndDate, Volume,
  Status FROM ProductionBatch WHERE StartDate
  BETWEEN StartDate AND EndDate OR EndDate BETWEEN StartDate AND EndDate;
END $$ 
DELIMITER ;

