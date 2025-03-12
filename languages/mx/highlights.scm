(line_comment) @comment

(string_literal "\"") @string
(multiline_string_literal "\"\"\"") @string
(string_fragment) @string
(multiline_string_fragment) @string
(escape_sequence) @string.escape
(int_literal) @number
(float_literal) @number

; Match identifiers to highlight them as variables
(identifier) @variable

; Call expressions
(call_expr) @function.call

(binary_expr op: "or" @keyword)
(binary_expr op: "and" @keyword)
(unary_expr op: "not" @keyword)

((identifier) @type
 (#match? @type "^[A-Z].*")) @type

; Match capital snake case as a constant
((identifier) @constant
  (#match? @constant "^[A-Z][A-Z_]+$"))

; Built-in identifiers
((identifier) @variable.special
  (#eq? @variable.special "self"))

((identifier) @variable.special
  (#eq? @variable.special "ref"))

((identifier) @variable.special
  (#eq? @variable.special "deref"))

((identifier) @variable.special
  (#eq? @variable.special "import"))

((identifier) @variable.special
  (#eq? @variable.special "c_type"))

((identifier) @variable.special
  (#eq? @variable.special "c_value"))

((identifier) @variable.special
  (#eq? @variable.special "cast"))

((identifier) @variable.special
  (#eq? @variable.special "typeof"))

[
 "fn"
 "if"
 "else"
 "return"
 "const"
 "var"
 "struct"
 "interface"
 "loop"
 "break"
 "continue"
 "map"
 "to"
] @keyword

[
 "+"
 "-"
 "*"
 "/"
] @operator

[
 "("
 ")"
 "{"
 "}"
 "["
 "]"
 ","
 ";"
 ":"
] @punctuation

(string_interpolation
  "${" @string.escape
  "}" @string.escape) @embedded

[
 "true"
 "false"
] @boolean
