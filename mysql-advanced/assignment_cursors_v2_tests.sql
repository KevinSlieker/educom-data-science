select distinct orderNumber as p_orderNumber from orderdetails where orderNumber in (select orderNumber
from orders
where customerNumber=363) ;


select sum(quantityOrdered*priceEach) from orderdetails where orderNumber in (select orderNumber
from orders
where customerNumber=363)
group by orderNumber;

select sum(quantityOrdered*priceEach) from orderdetails where orderNumber=10100 or orderNumber= 10192 or orderNumber=10322

select quantityOrdered*priceEach
from orderdetails