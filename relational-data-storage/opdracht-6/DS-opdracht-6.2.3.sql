select dayname(joindate) as "Dag van de week", count(id) "Aantal meldingen"
from mhl_suppliers
group by dayname(joindate)
order by dayofweek(joindate)