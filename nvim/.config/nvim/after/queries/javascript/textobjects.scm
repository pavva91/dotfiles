; extends

(variable_declarator) @vardef.inner

(variable_declaration) @vardef.outer
(lexical_declaration) @vardef.outer


(variable_declarator) @varassign.inner
(assignment_expression) @varassign.inner


(variable_declarator) @assignment.outer
(assignment_expression) @assignment.outer
(pair) @assignment.outer


((jsx_expression) @mustache.open
(#contains? @mustache.open "{{#"))

((jsx_expression) @mustache.open
(#contains? @mustache.open "{{^"))

((jsx_expression) @mustache.close
(#contains? @mustache.close "{{/"))

