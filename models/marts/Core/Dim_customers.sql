with customers as (
  select * from {{ref('stg_customers')}}
),
orders as (
  select * from {{ref('stg_orders')}}
),
payments as (
  select * from {{ref('stg_payments')}}
),
customer_orders as (
select customer_id,
min(order_date) as first_order_date,
max(order_date) as most_recent_order_date,
count(order_id) as number_of_orders
from orders
group by customer_id
),
payments_orders as (
select o.customer_id,
sum(p.AMOUNT_USD) lifetime_value
from orders o
inner join payments p on  o.order_id=p.order_id
where p.PAYMENT_STATUS='success'
group by o.customer_id
),
final as (
  select c.customer_id,
  c.first_name,
  c.last_name,
  co.first_order_date,
  co.most_recent_order_date,
  coalesce(number_of_orders,0) number_of_orders,
  coalesce(po.lifetime_value,0) lifetime_value
  from customers as c 
  left join customer_orders co on c.customer_id=co.customer_id
  left join payments_orders po on c.customer_id=po.customer_id
)

select * From final