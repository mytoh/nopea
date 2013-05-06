
(library (nopea cli)
    (export runner)
  (import
    (silta base)
    (silta write)
    (loitsu cli)
    (nopea commands))

  (begin

    (define (runner args)
      (match-short-command (cadr args)
        ("save"
         (save args))
        ("go"
         (go args))
        ((or "list" "ls")
         (refs))))

    ))
