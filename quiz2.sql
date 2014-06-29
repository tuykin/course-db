Вариант 1

1
SELECT c.name as city_name, a.name, a.code
FROM Airports a INNER JOIN Cities c 
ON c.id = a.city_id
INNER JOIN Countries cc
ON cc.id = a.country_id
WHERE cc.name = "Russia"

4.
