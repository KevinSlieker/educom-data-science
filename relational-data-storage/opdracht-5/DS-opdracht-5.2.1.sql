select S.name leverancier, ifnull(CON.name, "t.a.v. de directie") aanhef, if(S.p_address<>"", S.P_address, concat(straat, " ", huisnr)) adres,
if(S.p_address<>"", S.P_postcode, S.postcode) postcode, if(S.p_address<>"", CITP.name, CIT.name) stad,
if(S.p_address<>"", DISP.name, DIS.name) provincie
from  mhl_suppliers S
left join mhl_contacts CON on S.id=CON.supplier_ID and CON.department=3
left join mhl_cities CIT on S.city_ID=CIT.id
left join mhl_communes COM on CIT.commune_ID=COM.id
left join mhl_districts DIS on COM.district_ID=DIS.id
left join mhl_cities CITP on S.p_city_ID=CITP.id
left join mhl_communes COMP on CITP.commune_ID=COMP.id
left join mhl_districts DISP on COMP.district_ID=DISP.id
where postcode<>""
order by provincie, stad, leverancier
;