select count(mhl_hitcount.hitcount), avg(mhl_hitcount.hitcount), min(mhl_hitcount.hitcount), max(mhl_hitcount.hitcount), sum(mhl_hitcount.hitcount)
from mhl_hitcount
group by year, month
;