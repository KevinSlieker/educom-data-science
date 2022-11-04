select mhl_suppliers.name AS "supplier name", mhl_suppliers.straat, mhl_suppliers.huisnr, mhl_suppliers.postcode, pc_lat_long.lat, pc_lat_long.lng
from mhl_suppliers, pc_lat_long
where mhl_suppliers.postcode=pc_lat_long.pc6
order by pc_lat_long.lat desc
limit 5;