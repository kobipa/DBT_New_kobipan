with pyments as (
select * from {{ref('stg_payments')}}
    ),
orders as (
select * from {{ref('stg_orders')}}
    )
select o.order_id,o.customer_id,sum(p.AMOUNT_USD) order_AMOUNT from stg_orders o
left join pyments p on o.order_id=p.order_id
group by o.order_id,o.customer_id