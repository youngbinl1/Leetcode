# case 1: 2019-8-16까지 product-id가 바뀐 경우
select product_id, new_price as price
from Products
where (product_id, change_date) in (select product_id, max(change_date)
    from Products 
    where change_date < '2019-08-17'
    group by product_id)

union all
# case 2: 바뀌지 않은 경우
select distinct product_id, 
    10 as price
from Products
where product_id in (select product_id from Products group by product_id having min(change_date) > '2019-08-16')
