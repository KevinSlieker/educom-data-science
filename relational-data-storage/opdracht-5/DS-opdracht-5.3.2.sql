create or replace view VERZENDLIJST as
select S.id, if(S.p_address<>"", S.P_address, concat(straat, " ", huisnr)) adres,
if(S.p_address<>"", S.P_postcode, S.postcode) postcode, if(S.p_address<>"", CITP.name, CIT.name) stad
from  mhl_suppliers S
left join mhl_cities CIT on S.city_ID=CIT.id
left join mhl_cities CITP on S.p_city_ID=CITP.id