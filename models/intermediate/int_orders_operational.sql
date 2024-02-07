

select
        orders_id
        ,date_date
        ,SUM(margin + shipping_fee - logcost - cast(ship_cost as float64)) as operational_margin
        ,SUM(revenue) as revenue
        ,SUM(margin) as margin
    from {{ref('int_orders_margin')}} as margin_t
        left join {{ref('stg_raw__ship')}} as ship
        using (orders_id)
group by orders_id, date_date