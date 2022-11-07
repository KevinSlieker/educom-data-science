select C.name Stad, count(IF(S.membertype=1, 1, null)) Gold, count(if(S.membertype=2, 1, null)) Silver, count(if(S.membertype=3, 1, null)) Bronze, count(if(S.membertype>3, 1, null)) Other
from mhl_suppliers S
left join mhl_cities C on S.city_ID=C.id
group by Stad
order by Gold DESC, Silver DESC, Bronze DESC, Other DESC