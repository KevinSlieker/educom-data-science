select mhl_cities.name AS stad, ifnull(mhl_communes.name, "INVALID") AS gemeente
from mhl_cities
left join mhl_communes on mhl_cities.commune_ID=mhl_communes.id;