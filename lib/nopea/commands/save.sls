
(library (nopea commands save)
  (export
    save)
  (import
    (scheme base)
    (scheme write)
    (scheme file)
    (only (srfi :1)
          any)
    (loitsu file)
    )

  (begin

    (define (save-ref-to-file file name dir)
      (let ((lst (make-ref-list file name dir)))
        (if (file-exists? file)
          (remove-directory* file))
        (call-with-output-file
          file
          (lambda (out)
            (write lst out)))))

    (define (make-ref-list file name dir)
      (let ((file-list (car (file->sexp-list file))))
        (if (any (lambda (e) (string=? (car e) name))
                 file-list)
          file-list
          `(,@file-list
             (,name ,dir)))))

    (define (save args)
      (let ((nopea-file (build-path (home-directory)
                                    ".nopea"))
            (name (caddr args))
            (dir  (cadddr args)))
        (cond
          ((not (file-exists? nopea-file))
           (call-with-output-file nopea-file
                                  (lambda (o) (write '() o)))
           (save-ref-to-file nopea-file
                             name dir))
          (else
            (save-ref-to-file nopea-file
                              name dir)))))
    ))
