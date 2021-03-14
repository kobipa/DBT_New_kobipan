
select a.first_name,a.last_name,b.STATUS,c.PAYMENT_METHOD,count(b.ORDER_ID) orders_count,sum(c.AMOUNT_DOLLARS) TOTAL_AMOUNT_DOLLARS from "ANALYTICS"."CUSTOMERS" a 
inner join  "ANALYTICS"."STG_ORDERS" b using(CUSTOMER_ID)
inner join "ANALYTICS"."ANALYTICS"."STG_PAYMENTS" c using(ORDER_ID)
group by a.first_name,a.last_name,b.STATUS,c.PAYMENT_METHOD