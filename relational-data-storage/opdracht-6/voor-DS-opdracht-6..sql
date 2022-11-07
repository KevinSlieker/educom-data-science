ALTER TABLE mhl_suppliers 
  ADD joindate DATE NULL DEFAULT NULL 
  AFTER p_city_ID;

UPDATE mhl_suppliers 
   SET joindate=CAST(CONCAT(2000+membertype,'-',(id%12)+1, '-',(id%28)+1) AS DATE)

SELECT MIN(joindate), MAX(joindate) FROM mhl_suppliers