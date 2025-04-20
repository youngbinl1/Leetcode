select person_name
from (select person_name, turn, sum(weight) over (order by turn) as s
from Queue
group by person_id) as total
where s <= 1000
order by turn desc
limit 1
