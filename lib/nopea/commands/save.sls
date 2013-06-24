
(library (nopea commands save)
    (export
      save)
  (import
    (silta base)
    (silta file)
    (silta write)
    (silta cxr)
    (only (srfi :1)
          any)
    (only (srfi :13)
          string-take-right
          string-trim-right)
    (srfi :48)
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
            (write lst out)))
        (display-ref name dir)))

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
            (dir (normalize (cadddr args))))
        (cond
          ((not (file-exists? nopea-file))
           (call-with-output-file nopea-file
             (lambda (o) (write '() o)))
           (save-ref-to-file nopea-file
                             name dir))
          (else
              (save-ref-to-file nopea-file
                                name dir)))))

    (define (display-ref name dir)
      (format #t "~a -> ~a" name dir))

    (define (normalize path)
      (cond
        ((string=? "/" (string-take-right path 1))
         (string-trim-right path #\/))
        (else
            path)))

    ))
