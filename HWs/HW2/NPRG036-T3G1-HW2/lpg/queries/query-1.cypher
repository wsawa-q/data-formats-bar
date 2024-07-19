// Sum of wages of employees that work day shift over 10 shifts each 12 hours in the MorningBar
MATCH (br:Bar)-[:WORKS {shift: 'day'}]-(em:Employee)
WITH br, sum(em.wage)*120 AS Sum
WHERE br.name = "Rapture Morning"
RETURN Sum