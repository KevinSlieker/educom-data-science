delimiter $$

CREATE PROCEDURE p_get_office_by_country(IN countryName 
VARCHAR(255))

BEGIN
select *
from offices
where country=countryName
group by officeCode;
end$$

delimiter ;