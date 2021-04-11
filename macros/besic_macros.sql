{%  macro divided_column(clm_name,dev_by=100,decimal_place=2)   -%}
round(1.0*{{clm_name}}/{{dev_by}},{{decimal_place}})
{%-  endmacro    %}


{%  macro limit_data_in_dev(clm_nam,days_back=3)   -%}
    {% if target.name=='dev' %}   
        where {{clm_nam}}>=dateadd('day',-1*{{days_back}},current_timestamp )
    {% endif %}

{%-  endmacro    %}