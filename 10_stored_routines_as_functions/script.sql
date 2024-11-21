DELIMITER // 
  CREATE FUNCTION CalculateBatchProductionDuration(batch_id INT)
  RETURNS INT DETERMINISTIC BEGIN DECLARE start_date DATE;
DECLARE end_date DATE; DECLARE duration INT;
SELECT StartDate, EndDate INTO start_date, end_date FROM ProductionBatch WHERE BatchID = batch_id;
SET duration = DATEDIFF(end_date, start_date);
RETURN duration;
END //
DELIMITER ;

ALTER TABLE RawMaterial
ADD COLUMN PricePerUnit DECIMAL(10,2) NOT NULL DEFAULT 0;
DELIMITER // 
CREATE FUNCTION GetTotalRawMaterialValue()
RETURNS DECIMAL(10,2) DETERMINISTIC BEGIN DECLARE total_value DECIMAL(10,2) DEFAULT 0;
SELECT SUM(QuantityOnHand * PricePerUnit) INTO total_value FROM RawMaterial;
RETURN total_value;
END //
DELIMITER ;


-- Write your SQL code here
