select H.year Jaar, sum(IF(month in ('1', '2', '3'), H.hitcount, 0)) "Eerste kwartaal"
, sum(IF(month in('4', '5', '6'), H.hitcount, 0)) "Tweede kwartaal"
, sum(IF(month in('7', '8', '9'), H.hitcount, 0)) "Derde kwartaal"
, sum(IF(month in('10', '11', '12'), H.hitcount, 0)) "Vierde kwartaal"
, sum(H.hitcount) Totaal
from mhl_hitcount H
group by jaar