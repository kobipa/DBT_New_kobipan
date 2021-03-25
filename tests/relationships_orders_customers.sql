with payments as 
(
select * from {{ref('stg_payments')}}
)
,customers as 
(select * from {{ref('stg_customers')}})
,orders as 
(select * from {{ref('stg_orders')}})


select p.order_id,p.CUSTOMER_ID from orders p
left join customers c on p.CUSTOMER_ID=c.CUSTOMER_ID
where c.CUSTOMER_ID is null