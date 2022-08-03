{% macro get_payment_methods() %}
{% set payment_methods_query %}
SET json_serialization_enable TO true;
select 
nodeaddress
from "volte"."volte"
{% endset %}

{% set results = run_query(payment_methods_query) %}

{{ log(results, info=True) }}

{{ return([]) }}
{% endmacro %}