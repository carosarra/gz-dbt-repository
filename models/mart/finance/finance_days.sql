select
date_date
,count(orders_id) as nb_transaction
,round(sum(revenue),1) as revenue
,round(avg(revenue),1) as average_basket
,round(sum(margin),1) as margin
,round(sum(operational_margin),1) as operational_margin
from {{ ref('int_orders_operational') }}
group by date_date
order by date_date DESC





