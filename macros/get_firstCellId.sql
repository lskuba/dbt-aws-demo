{% macro get_firstCellId(accessNetworkInformation) %}
    split_part( {{accessNetworkInformation}} , 'utran-cell-id-3gpp=', 2)
{% endmacro %}