#lang racket

(require racket/serialize
         racket/struct
         "flyover.rkt"
         "propel-models.rkt"
         "propel-names.rkt"
         "propel-syntax.rkt"
         )

(require racket/fasl)

#;(call-with-output-file "parsed.rkt"
    (λ (out) (write (serialize (module-functions propel-module)) out))
    #:exists 'truncate/replace)
; the syntax tree *can* be serialized, but the result is not nice.
; better to serialize just datums and preserve source locations using a custom representation
#;(call-with-output-file "parsed.fasl"
    (λ (out) (s-exp->fasl (serialize module-functions) out))
    #:exists 'truncate/replace)

;(print module-functions)

(define fs (module-functions propel-module))

; Resolve forms in all functions
(hash-for-each fs (λ (name f) (hash-set!
                               fs name (struct-copy
                                        function f
                                        [body (resolve-forms (function-body f))]))))

(define (update-functions updater)
  (hash-for-each fs (λ (name f) (let ([f* (updater f)])
                                  (begin
                                    (print f*)
                                    (hash-set! fs name f*))
                                    ))))


(update-functions resolve-names/function)

(update-functions resolve-types/function)
