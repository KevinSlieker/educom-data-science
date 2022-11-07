create or replace view DIRECTIE AS
select mhl_contacts.supplier_ID ID, mhl_contacts.name contact, mhl_contacts.contacttype, mhl_departments.name department
from mhl_contacts
LEFT join mhl_departments on mhl_contacts.department=mhl_departments.id
where mhl_departments.name="Directie" or mhl_contacts.contacttype like "%directeur%"