select mhl_cities.name AS stad, mhl_cities.id, C2.id as id2, mhl_cities.commune_ID AS gemeente_id, C2.commune_ID AS gemeente2_id,
mhl_communes.name as gemeente_name, G2.name as gemaante2_name
from mhl_cities
join mhl_cities as C2 on mhl_cities.name=C2.name
join mhl_communes on mhl_cities.commune_ID=mhl_communes.id
join mhl_communes as G2 on C2.commune_ID=G2.id
where mhl_cities.id < C2.id
order by mhl_cities.name;