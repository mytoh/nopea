
(define-module nopea.commands.refs
  (export refs)
  (use srfi-1)
  (use file.util)
  )
(select-module nopea.commands.refs)

(define (refs)
  (let ((file-list (call-with-input-file
                     (build-path (home-directory) ".nopea")
                     read)))
    (for-each
      (lambda (e)
        (format #t "~a ~a\n"
                (car e) (cadr e)))
      file-list)))

