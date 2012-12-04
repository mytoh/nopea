
(library (nopea commands go)
  (export
    go)
  (import
    (except (rnrs)
            find)  
    (only (srfi :1)
          find)
    (loitsu file))

  (begin

    (define (go args)
      (let ((name (caddr args)))
        (let* ((file-list (car (file->sexp-list
                                 (build-path (home-directory) ".nopea"))))
               (found (find (lambda (e) (string=? (car e) name))
                            file-list))
               (dir (if found (cadr found)
                      #f)))
          (cond
            (dir
              (display dir)) 
            (else
              (display "no such reference") 
              (newline))))))

    ))
