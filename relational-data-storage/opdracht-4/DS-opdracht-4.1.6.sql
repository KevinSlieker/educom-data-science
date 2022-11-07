select mhl_hitcount.hitcount, mhl_suppliers.name AS "supplier name", mhl_cities.name AS stad, mhl_communes.name AS gemeente, mhl_districts.name AS provincie
from mhl_suppliers
inner join mhl_cities on mhl_suppliers.city_ID=mhl_cities.id
inner join mhl_communes on mhl_cities.commune_ID=mhl_communes.id
inner join mhl_districts on mhl_communes.district_ID=mhl_districts.id
inner join mhl_hitcount ON mhl_suppliers.id=mhl_hitcount.supplier_id and mhl_hitcount.year="2014" and mhl_hitcount.month="1"
WHERE ( mhl_districts.name="Brabant" or mhl_districts.name="Limburg" or mhl_districts.name="Zeeland");