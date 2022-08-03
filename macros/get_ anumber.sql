{% macro get_anumber(number) %}
    split_part({{number}}, '+354', 2)
{% endmacro %}