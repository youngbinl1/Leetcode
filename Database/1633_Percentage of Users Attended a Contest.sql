select r.contest_id, round(100 * count(r.user_id)/(select count(user_id) from Users), 2) as percentage 
from Users as u
left join Register as r
on u.user_id = r.user_id
where r.contest_id is not null
group by r.contest_id
order by percentage desc, r.contest_id asc
