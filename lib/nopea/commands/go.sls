
(library (nopea commands go)
    (export
      go)
  (import
    (silta base)
    (silta write)
    (silta cxr)
    (only (srfi :1)
          find)
    (loitsu file))

  (begin

    (define (go args)
      (let ((name (caddr args))
            (paths (cdddr args)))
        (let* ((file-list (car (file->sexp-list
                                (build-path (home-directory) ".nopea"))))
               (found (find (lambda (e) (string=? (car e) name))
                        file-list))
               (dir (if found (cadr found)
                        #f)))
          (cond
            (dir
             (if (not (null? paths))
               (display (apply build-path dir paths))
               (display dir)))
            (else
                (display "no such reference")
              (newline))))))

    ))
