select S.name name, sum(mhl_hitcount.hitcount) numhits, count(mhl_hitcount.month) nummonths, round(avg(mhl_hitcount.hitcount), 0) avgpermonth
from mhl_hitcount
inner join mhl_suppliers S on mhl_hitcount.supplier_ID=S.id
group by name
order by avgpermonth DESC
;