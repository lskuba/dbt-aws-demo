{% macro drop_id_prefix(type_column ) %}
    split_part({{type_column}}, '-', 2)
{% endmacro %}