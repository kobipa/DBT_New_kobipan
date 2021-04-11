select 
{{dbt_utils.surrogate_key(['customer_id','order_date'])}} as id,
customer_id,
 order_date,
count(*) as orders_amount
from  {{'stg_orders'}} ord 
group by customer_id,order_date
order by customer_id,order_date
limit 50000