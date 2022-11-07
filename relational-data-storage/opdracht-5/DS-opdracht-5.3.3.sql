select S.name, ifnull(DIR.contact, "t.a.v. de directie") contact, VER.adres adres, VER.postcode postcode, VER.stad stad
from mhl_suppliers S
left join directie DIR on S.id=DIR.id
left join verzendlijst VER on S.id=VER.id