{%- set payment_methods = get_payment_methods() -%}
SET json_serialization_enable TO true;
{% set my_json_str = '{"abc": 123}' %}

with records as (
    select
        nodeaddress,
        {{ fromjson(my_json_str)['abc'] }}
    from "volte"."volte"
)
select * from records
