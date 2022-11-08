select date_format(joindate, get_format(date, 'EUR')) as joindate, id
from mhl_suppliers
where (joindate>=((last_day(joindate)-7)))