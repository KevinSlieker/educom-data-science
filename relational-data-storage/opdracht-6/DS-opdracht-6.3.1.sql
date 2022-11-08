select name, case when name like "'%" then lcase(substring(name, 2)), ucase(substring(name, 4)
else ucase(substring(name,1)) end
from mhl_cities
order by name