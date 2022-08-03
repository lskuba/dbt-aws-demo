{% macro get_recordid(fileName, lineNumber) %}
    'G' + split_part({{fileName}}, '_', 1) + {{lineNumber}}
{% endmacro %}