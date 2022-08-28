## Propel language

Run tests: `PLT_CS_DEBUG=1 raco test test*.rkt`

```
   Source (DSL in Racket)
-> Source with macros expanded (propel.rkt)
-> Source with syntax forms expanded (`player.pos.x`, `#%app` etc; propel-syntax.rkt)
-> Resolved names (propel-names.rkt)
-> Resolved types (propel-types.rkt)
```

### Primitive types

- `void` / `nil`
- `int`

### Core forms (TBD)

- `(#%app <func> <args>)`
- `(#%begin <stmt> ...+)`
- `(#%dot <expr> <name>)`
- `(#%if <expr> <then> <else>)`
- `(#%var <scope-num> <name>)`

Note: All of these must be represented as `#<syntax>` objects, this is quite annoying.
      Might be better to preserve original syntax objects explicitly as another field in the representation.

#### Already deprecated

- `(#%argument <name-stx>)`
- `(#%builtin-function <name-stx>)` -- maybe we *do* want this, because it tells us how to figure out the function signature
- `(#%module-function <name>)`

### Open questions

- how to represent types in compiler?
- why aren't we using `syntax-parse`? -> because we need to execute code, not merely fill a template
- usage of pairs vs lists for AST structures -> lists get printed more consistently, pairs can get mis-interpreted as list heads

### Scoping

- for now, it is not very elegant:
  - types can be built-in or module-level
  - functions can be built-in or module-level (functions names are _not_ values)
  - (constants can be built-in or module-level or local)
  - variables can be built-in or module-level or arguments or local
