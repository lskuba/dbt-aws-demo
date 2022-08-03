{% macro get_node_address(nodeaddress_column ) %}
        fromjson({{nodeaddress_column}})
        
{% endmacro %}