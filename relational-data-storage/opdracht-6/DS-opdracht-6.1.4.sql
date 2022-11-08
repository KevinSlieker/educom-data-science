create or replace view RUBRIEKEN as
select ifnull(S.id, R.id) as id, if(isnull(R.name), S.name, concat(R.name, ' - ', S.name)) as rubriek,
ifnull(R.name, S.name) as hoofdrubriek,
if(isnull(R.name), '', S.name) as subrubriek
from mhl_rubrieken R
right outer join mhl_rubrieken S on R.id=S.parent
order by rubriek;

select rubrieken.rubriek as name, ifnull( 
(select sum(H.hitcount)
from mhl_suppliers_mhl_rubriek_view SR
inner join mhl_hitcount H on SR.mhl_suppliers_ID=H.supplier_ID
where mhl_rubriek_view_ID=rubrieken.id), 'Geen hits') as total
from rubrieken
order by name
