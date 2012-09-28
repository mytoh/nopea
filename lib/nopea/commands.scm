(define-module nopea.commands
  (extend
    nopea.commands.save
    nopea.commands.go
    nopea.commands.refs
    )
  )
(select-module nopea.commands)
