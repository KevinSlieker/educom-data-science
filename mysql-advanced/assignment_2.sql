DROP PROCEDURE if exists p_get_total_order;

DELIMITER $$

CREATE PROCEDURE p_get_total_order()
BEGIN
    SELECT customerNumber, COUNT(*) as totalOrders
    FROM orders
    group by customerNumber;
END$$

DELIMITER ;