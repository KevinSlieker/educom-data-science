select mhl_suppliers.name AS "supplier name", mhl_suppliers.straat, mhl_suppliers.huisnr, mhl_suppliers.postcode, mhl_rubrieken.name AS "rubriek name"
from mhl_suppliers_mhl_rubriek_view
inner join mhl_suppliers on mhl_suppliers_mhl_rubriek_view.mhl_suppliers_ID=mhl_suppliers.ID and mhl_suppliers.city_ID=104
inner join mhl_rubrieken on mhl_suppliers_mhl_rubriek_view.mhl_rubriek_view_ID=mhl_rubrieken.ID and (mhl_rubrieken.name="drank" or mhl_rubrieken.parent=235)
order by mhl_rubrieken.name, mhl_suppliers.name;