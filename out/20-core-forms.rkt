((factorial
  ((n int))
  int
  (#%begin (#%if (#%app = n 0) 1 (#%app * n (#%app factorial (#%app - n 1)))))
  #f
  ((#<path:/workspace/lisp-experiments/tests/factorial.rkt> 2 0 29 86)
   (#f 0 0 0 86)
   ((#f 1 2 33 52)
    (#f 0 0 0 52)
    ((#f 0 4 4 7) (#f 0 0 0 7) (#f 0 1 1 1) (#f 0 2 2 1) (#f 0 2 2 1))
    (#f 1 -5 9 1)
    ((#f 1 0 8 25)
     (#f 0 0 0 25)
     (#f 0 1 1 1)
     (#f 0 2 2 1)
     ((#f 0 2 2 19)
      (#f 0 0 0 19)
      (#f 0 1 1 9)
      ((#f 0 10 10 7)
       (#f 0 0 0 7)
       (#f 0 1 1 1)
       (#f 0 2 2 1)
       (#f 0 2 2 1))))))))