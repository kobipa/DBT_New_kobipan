select * from (
select c.CUSTOMER_ID,c.LIFETIME_VALUE,sum(order_AMOUNT) total_order_AMOUNT from {{ref('Dim_customers')}} c 
left join  {{ref('fct_orders')}} o on c.CUSTOMER_ID=o.CUSTOMER_ID
group by c.customer_id,c.LIFETIME_VALUE
) q where abs(LIFETIME_VALUE-total_order_AMOUNT)>0