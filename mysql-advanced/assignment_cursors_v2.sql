DROP PROCEDURE if exists p_create_customer_reporting;

DELIMITER $$

CREATE PROCEDURE p_create_customer_reporting(inout pCustomerNumber int(100))
BEGIN
declare finished integer default 0;
declare p_customerName varchar(100) default "";
declare customerTotalOrderAmount decimal(20,2) default 0;
declare customerTotalOrder decimal(20,2);
declare p_orderNumber int(20) default 0;

declare curReporting cursor for 
select distinct orderNumber from orderdetails where orderNumber in (select orderNumber
from orders
where customerNumber=pCustomerNumber);

declare continue handler for NOT FOUND set finished = 1;

set customerTotalOrder = 0;


select customerName from customers where customerNumber=pCustomerNumber
into p_customerName;

open curReporting;

getReporting: loop
fetch curReporting into p_orderNumber;
if finished = 1 then leave getReporting;
end if;
set customerTotalOrder = customerTotalOrder + (select sum(quantityOrdered*priceEach) from orderdetails where orderNumber=p_orderNumber);


end loop getReporting;
close curReporting;

set customerTotalOrderAmount = customerTotalOrder;


CREATE TABLE if not exists `customer_reporting` (
`customerNumber` int(11) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `totalOrderAmount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`customerNumber`),
  CONSTRAINT `customer_reporting_ibfk_1` FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
    
insert into customer_reporting(`customerNumber`,`customerName`, `totalOrderAmount`)
values (pCustomerNumber, p_customerName, customerTotalOrderAmount) on duplicate key update `customerNumber` = pCustomerNumber, `customerName` = p_customerName, `totalOrderAmount` = customerTotalOrderAmount;

select p_customerName, customerTotalOrderAmount;

end$$

DELIMITER ;