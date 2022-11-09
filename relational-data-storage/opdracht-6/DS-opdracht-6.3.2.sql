select name, HTML_UnEncode(name) as nicename
from mhl_suppliers
where name regexp "&[^\s]*;"
limit 25