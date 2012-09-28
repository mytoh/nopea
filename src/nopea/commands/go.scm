
(define-module nopea.commands.go
  (export go)
  (use srfi-1)
  (use file.util)
  )
(select-module nopea.commands.go)

(define (go name)
  (let ((file-list (call-with-input-file
                     (build-path (home-directory) ".nopea")
                     read)))
    (and-let* ((found
                 (find (lambda (e) (string=? (car e) name))
                      file-list))
               (dir (cadr found)))
      (if dir
        (display dir)
        (print "no such reference")))))

