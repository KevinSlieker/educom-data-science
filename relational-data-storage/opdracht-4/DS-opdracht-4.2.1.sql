select mhl_cities.name AS stad, mhl_cities.commune_ID
from mhl_cities
left join mhl_communes on mhl_cities.commune_ID=mhl_communes.id
where isnull(mhl_communes.name);