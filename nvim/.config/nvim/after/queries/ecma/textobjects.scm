; extends

(variable_declarator) @assignment.outer
(assignment_expression) @assignment.outer
(pair) @assignment.outer

(variable_declarator
  name: (_) @assignment.lhs)

(assignment_expression
  left: (_) @assignment.lhs)

(variable_declarator
  value: (_) @assignment.rhs)

(assignment_expression
  right: (_) @assignment.rhs)

(variable_declaration) @vardef.outer
(lexical_declaration) @vardef.outer

((jsx_expression) @mustache.open
(#contains? @mustache.open "{{#"))

((jsx_expression) @mustache.open
(#contains? @mustache.open "{{^"))

((jsx_expression) @mustache.close
(#contains? @mustache.close "{{/"))


