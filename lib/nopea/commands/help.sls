(library (nopea commands help)
    (export
      help)
  (import
    (silta base)
    (silta write)
    (silta cxr))

  (begin

    (define (help)
      (display
          "Usage: nopea <command>
        go <name>
        list, ls
        save <name> <directory>")
      (newline))

    ))
