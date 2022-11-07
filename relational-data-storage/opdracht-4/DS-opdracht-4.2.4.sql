select S.name supplier_name, P.name propertytypes_name, ifnull(YN.content, "NOT SET") value
from mhl_suppliers S
cross join mhl_propertytypes P
left join mhl_yn_properties YN on S.id=YN.supplier_ID AND YN.propertytype_ID=P.id
WHERE S.city_ID="104" and P.proptype="A"
;