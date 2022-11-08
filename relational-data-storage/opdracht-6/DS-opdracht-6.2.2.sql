select id, joindate as joindate, datediff(current_date, joindate) as dagen_lid
from mhl_suppliers
order by dagen_lid