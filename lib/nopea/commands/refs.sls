
(library (nopea commands refs)
  (export
    refs)
  (import
    (rnrs)
    (srfi :48)
    (loitsu file))

  (begin

    (define (refs)
      (let ((file-list (car (file->sexp-list (build-path (home-directory) ".nopea")))  
                       ))
        (for-each
          (lambda (e)
            (format #t "~a ~a\n"
                    (car e) (cadr e)))
          file-list)))

    ))
