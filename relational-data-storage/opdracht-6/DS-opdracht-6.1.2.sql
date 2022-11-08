select B.gemeente, A.leverancier, A.total_hitcount, B.average_hitcount
from (select COM.id, S.name as leverancier, sum(H.hitcount) as total_hitcount
from mhl_suppliers S
inner join mhl_hitcount H on S.id=H.supplier_ID
inner join mhl_cities C on S.city_ID=C.id
inner join mhl_communes COM on C.commune_ID=COM.id
inner join mhl_districts D on COM.district_ID=D.id
where D.country_ID = (select id
from mhl_countries
where name="Nederland")
group by COM.id, S.name
) as A
inner join (
select COM.id, avg(H.hitcount) as "average_hitcount", COM.name as gemeente
from mhl_suppliers S
inner join mhl_hitcount H on S.id=H.supplier_ID
inner join mhl_cities C on S.city_ID=C.id
inner join mhl_communes COM on C.commune_ID=COM.id
inner join mhl_districts D on COM.district_ID=D.id
where D.country_ID = (select id
from mhl_countries
where name="Nederland")
group by COM.id) as B on A.id=B.id
group by B.id, A.leverancier
having A.total_hitcount > B.average_hitcount
order by B.gemeente, (A.total_hitcount-B.average_hitcount) desc
