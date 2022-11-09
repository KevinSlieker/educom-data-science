select name, case when name like "'%" then concat(lcase(substring(name,1,2)), ucase(substring(name,3,2)), SUBSTRING(name,5))
else  concat(ucase(substring(name,1,1)), substring(name,2)) end as nice_name
from mhl_cities
order by name