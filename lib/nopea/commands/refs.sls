
(library (nopea commands refs)
    (export
      refs)
  (import
    (silta base)
    (srfi :48)
    (loitsu file))

  (begin

    (define (refs)
      (let ((file-list (car (file->sexp-list (build-path (home-directory) ".nopea")))))
        (for-each
            (lambda (e)
              (format #t "~a\t-> ~a\n"
                      (car e) (cadr e)))
          file-list)))

    ))
