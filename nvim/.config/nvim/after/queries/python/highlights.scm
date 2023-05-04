(("not" @keyword.operator) (set! conceal "¬"))
("or" @keyword.operator (set! conceal "∨"))
("and" @keyword.operator (set! conceal "∧"))
("in" @keyword.operator (set! conceal "∈"))

("==" @operator (set! conceal "≡"))
("!=" @operator (set! conceal "≢"))
("<=" @operator (set! conceal "≤"))
(">=" @operator (set! conceal "≥"))
("*" @operator (set! conceal "∙"))

((type (identifier) @type) (#eq? @type "int") (set! conceal "ℤ"))
((type (identifier) @type) (#eq? @type "float") (set! conceal "ℝ"))
