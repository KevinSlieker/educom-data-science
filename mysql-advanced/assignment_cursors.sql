DROP PROCEDURE if exists p_create_customer_reporting;

DELIMITER $$

CREATE PROCEDURE p_create_customer_reporting(inout pCustomerNumber int(100))
BEGIN
declare finished integer default 0;
declare customerName varchar(100) default "";
declare customerTotalOrderAmount decimal(20,2) default 0;
declare customerTotalOrder decimal(20,2) default 0;

declare curReporting cursor for 
select customerNumber from customers
where customerNumber=pCustomerNumber;

declare continue handler for NOT FOUND set finshed = 1;

open curReporting;

getReporting: loop
select customerName from customers where customerNumber=curReporting
into customerName;
select ((for each orderLineNumber from orderdetails where orderNumber in (select orderNumber
from orders
where customerNumber=curReporting))
customerTotalOrder += (quantityOrdered*priceEach)
) into customerTotalOrderAmount;
if finished = 1 then leave getReporting;
end if;

CREATE TABLE if not exists `customer_reporting` (
  `customerName` varchar(100) NOT NULL,
  `totalOrderAmount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`customerName`),
	CONSTRAINT `customer_reporting_ibfk_1` FOREIGN KEY (`customerName`) REFERENCES `customers` (`customerName`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
    
insert into customer_reporting(customerName, totalOrderAmount)
values (customerName, customerTotalOrderAmount);


end loop getReporting;
close curReporting;

select customerName, customerTotalOrderAmount;

end$$

DELIMITER ;