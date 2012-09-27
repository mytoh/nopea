(define-module nopea.cli
  (export runner)
  (use gauche.parseopt)
  (use util.match)
  (use file.util)
  (use nopea)
  (use nopea.commands)
  )
(select-module nopea.cli)

(define runner
  (lambda (args)
    (let-args (cdr args)
      ((#f "h|help" (exit 0))
       . rest)
      (when (null-list? rest)
        (exit 0))
      (match (car  rest)
        ;; actions
        ("install"
         (install (cadr rest)))
        ((or "uninstall" "rm")
         (uninstall (cadr rest)))
        ("setup"
         (setup (cadr rest)))
        ("command"
         (print-commands))
        (_ (exit 0))))))
