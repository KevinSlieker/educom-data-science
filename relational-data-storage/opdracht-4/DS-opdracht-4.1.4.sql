select mhl_suppliers.name AS "supplier name", mhl_suppliers.straat, mhl_suppliers.huisnr, mhl_suppliers.postcode
from mhl_yn_properties
inner join mhl_suppliers on mhl_yn_properties.supplier_ID=mhl_suppliers.ID
inner join mhl_propertytypes on mhl_yn_properties.propertytype_ID=mhl_propertytypes.ID
WHERE mhl_propertytypes.name="specialistische leverancier" or mhl_propertytypes.name="ook voor particulieren";