SELECT id, first_name, last_name FROM people
WHERE id in (
  SELECT personId FROM visits
  GROUP BY personID
  ORDER BY count(personID) DESC
  LIMIT 10)
;

DELETE FROM frequent_browsers;

INSERT INTO frequent_browsers
SELECT personId as person_id, COUNT(personId) as num_sites_visited
FROM visits
GROUP BY personId
ORDER BY COUNT(personId) DESC
LIMIT 10;

SELECT * FROM  frequent_browsers;


