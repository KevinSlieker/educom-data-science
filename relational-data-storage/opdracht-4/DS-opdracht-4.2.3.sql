select R2.id, 
ifnull(R.name, R2.name) hoofdrubriek,
IF(isnull(R.name), '', R2.name) subrubriek
from mhl_rubrieken R
right join mhl_rubrieken R2 on R.id=R2.parent
order by hoofdrubriek, subrubriek;