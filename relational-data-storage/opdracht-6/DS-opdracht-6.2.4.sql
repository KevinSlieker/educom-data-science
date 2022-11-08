select year(joindate) as Jaar, monthname(joindate), count(id) Aantal
from mhl_suppliers
group by year(joindate), monthname(joindate)
order by year(joindate), month(joindate)