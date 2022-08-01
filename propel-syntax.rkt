#lang racket

(require racket/serialize)

(provide function)

; (symbol list symbol syntax)
(struct function (name args ret body) #:mutable #:transparent
  #:property prop:serializable
  (make-serialize-info
   (λ (this)
     (vector (function-name this)
             (function-args this)
             (function-ret this)
             (syntax-serialize (function-body this))))
   'function-deserialize
   #t
   (or (current-load-relative-directory) (current-directory)))
  )

(define function-deserialize
  (make-deserialize-info
   (λ (name args ret stx)
     (function name args ret (syntax-deserialize stx)))
   (λ ()
     (define f (function 'transporter-error 'transporter-error 'transporter-error 'transporter-error))
     (values f
             (λ (name args ret stx)
               (begin
                 (set-function-name! f name)
                 (set-function-args! f args)
                 (set-function-ret! f ret)
                 (set-function-body! (syntax-deserialize stx))
                 ))))))
