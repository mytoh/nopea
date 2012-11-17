
(library (nopea cli)
  (export runner)
  (import
    (scheme base)
    (scheme write)
    (match)
    (nopea commands))

  (begin

    (define (runner args)
      (match (cadr args)
        ((or "save" "s")
         (save args))
        ((or "go" "g")
         (go args))
        ((or "refs" "l" "ls" "list")
         (refs))
        )))




  )
