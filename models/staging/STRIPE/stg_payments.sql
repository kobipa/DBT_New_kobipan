select ID as PAYMENT_ID,
ORDERID as ORDER_ID,
PAYMENTMETHOD,
STATUS PAYMENT_STATUS ,
{{divided_column('AMOUNT')}}  as AMOUNT_USD,
CREATED
from {{source('STRIPE','PAYMENT')}}  
{{limit_data_in_dev(clm_nam='_BATCHED_AT',days_back=3) }}