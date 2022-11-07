select
year as jaar, months.name as maand, num_sup as "aantal leveranciers", hits as "totaal aantal hits"
from (select year, month, count(supplier_ID) as num_sup, sum(hitcount) as hits
from mhl_hitcount H
group by year, month
order by year, month) as totals
join months on month=months.id
order by year DESC, months.name