select mhl_cities.name AS stad, C2.name AS stad2, mhl_cities.id, C2.id, mhl_cities.commune_ID AS gemeente_id, C2.commune_ID AS gemeente2_id
from mhl_cities
join mhl_cities as C2 on mhl_cities.name=C2.name
where mhl_cities.id < C2.id
order by mhl_cities.name;