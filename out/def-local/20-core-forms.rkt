((add
  ((a int) (b int))
  int
  (#%begin
   (#%define left a)
   (#%define right b)
   (#%define sum (#%app + left right))
   sum)
  #f
  ((#<path:/workspace/lisp-experiments/tests/def-local.rkt> 2 0 29 97)
   (#f 0 0 0 97)
   ((#f 1 2 35 12) (#f 0 0 0 12) (#f 0 5 5 4) (#f 0 5 5 1))
   ((#f 1 -10 5 13) (#f 0 0 0 13) (#f 0 5 5 5) (#f 0 6 6 1))
   ((#f 1 -11 5 24)
    (#f 0 0 0 24)
    (#f 0 5 5 3)
    ((#f 0 4 4 14) (#f 0 0 0 14) (#f 0 1 1 1) (#f 0 2 2 4) (#f 0 5 5 5)))
   (#f 1 -17 10 3))))