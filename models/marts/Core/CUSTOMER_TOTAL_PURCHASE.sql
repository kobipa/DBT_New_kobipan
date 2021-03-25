
select a.first_name,a.last_name,b.STATUS,c.PAYMENTMETHOD,count(b.ORDER_ID) orders_count,sum(c.AMOUNT_USD) TOTAL_AMOUNT_DOLLARS from {{ref('stg_customers')}} a 
inner join  {{ref('stg_orders')}} b using(CUSTOMER_ID)
inner join {{ref('stg_payments')}}  c using(ORDER_ID)
group by a.first_name,a.last_name,b.STATUS,c.PAYMENTMETHOD