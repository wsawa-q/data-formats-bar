// Given name, phone number and bar name where all employees have at least 1 phone number and work in a bar with open terrace
Match (em:Employee)-[:WORKS]-(br:Bar)-[:EQUIPED]-(tr:Terrace)
WHERE tr.open = true AND em.phone <> false
RETURN em.givenName, em.phone, br.name