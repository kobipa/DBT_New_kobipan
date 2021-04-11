{%- set PAYMENT_METHODS=['credit_card','coupon','bank_transfer','gift_card'] -%}

with payments as 
(select * from {{ref('stg_payments')}}),
pivoted as 
( select  a.order_id,
 
{%- for METHOD in  PAYMENT_METHODS  -%}
  sum( case when PAYMENTMETHOD='{{METHOD}}' then AMOUNT_USD else 0 end) as {{METHOD}}_amount
    {%- if not loop.last -%}
     ,
    {%endif%}
{%- endfor %}
from payments a 
 where PAYMENT_STATUS='success'
group by a.order_id
) 

select * from pivoted
 