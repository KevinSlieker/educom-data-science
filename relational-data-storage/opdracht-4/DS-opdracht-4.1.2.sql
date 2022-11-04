select mhl_suppliers.name, mhl_suppliers.straat, mhl_suppliers.huisnr, mhl_suppliers.postcode, mhl_cities.name AS plaatsnaam 
from mhl_suppliers
join mhl_cities on mhl_suppliers.city_ID=mhl_cities.ID
join mhl_communes on mhl_cities.commune_ID=mhl_communes.ID and mhl_communes.name="steenwijkerland";