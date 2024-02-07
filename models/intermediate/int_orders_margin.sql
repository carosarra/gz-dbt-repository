select
    orders_id
    ,date_date
    ,round(sum(revenue),2) as revenue
    ,round(sum(quantity),2) as quantity
    ,round(sum(purchase_price*quantity),2) as purchase_cost
    ,round(sum(revenue - (purchase_price*quantity)),2) as margin
    
from {{ ref('stg_raw__sales') }} 
join {{ ref('stg_raw__product') }} using(products_id)
group by orders_id, date_date