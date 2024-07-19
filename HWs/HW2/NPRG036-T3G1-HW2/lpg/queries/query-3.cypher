// Return all the bar and the amount of drinks where there are drinks with precengages higher than 30%
MATCH (br:Bar)-[:HAS]-(mn:Menu)-[:CONTAINS]-(dr:Drink)
WHERE dr.percentage > 30
RETURN br.name, count(dr) AS amount