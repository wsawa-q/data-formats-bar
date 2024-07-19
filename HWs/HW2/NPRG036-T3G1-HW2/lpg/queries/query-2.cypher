// All drinks of the bar where Asher Pratt works
MATCH (dr:Drink)-[:CONTAINS]-(mn:Menu)-[:HAS]-(br:Bar)-[:WORKS]-(em:Employee)
WHERE em.givenName = 'Asher' AND em.familyName = 'Pratt' 
RETURN dr