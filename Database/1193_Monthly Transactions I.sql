select 
    DATE_FORMAT(trans_date, '%Y-%m') as month,
    country,
    count(*) as trans_count,
    count(case when state = 'approved' then 1 else NULL END) as approved_count,
    sum(amount) as trans_total_amount,
    sum(case when state = 'approved' then amount else 0 END) as approved_total_amount
from Transactions
group by month, country
