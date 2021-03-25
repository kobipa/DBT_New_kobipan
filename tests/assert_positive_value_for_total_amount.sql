select  ORDER_ID,sum(AMOUNT_USD) total_pyments from {{ref('stg_payments')}}
group by ORDER_ID
having total_pyments<=0