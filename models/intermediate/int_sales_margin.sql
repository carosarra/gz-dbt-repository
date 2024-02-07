SELECT
    orders_id
    ,date_date
    ,revenue
    ,quantity
    ,round(purchase_price*quantity,2) as purchase_cost
    ,round(revenue - (purchase_price*quantity),2) as margin
    ,{{ margin_percent('revenue','purchase_cost') }} as margin_percent


FROM{{ ref('stg_raw__sales') }}
JOIN {{ ref('stg_raw__product') }}
USING(products_id)






