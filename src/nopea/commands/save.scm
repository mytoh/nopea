

(define-module nopea.commands.save
  (export save)
  (use kirjasto.config)
  (use srfi-1)
  (use file.util))
(select-module nopea.commands.save)

(define (save-ref-to-file file name dir)
  (let ((lst (make-ref-list file name dir)))
    (call-with-output-file
      file
      (lambda (out)
        (write lst out)))))

(define (make-ref-list file name dir)
  (let ((file-list (read-config file )))
    (if (any (lambda (e) (string=? (car e) name))
             file-list)
      file-list
      `(,@file-list
         (,name ,dir)))))

(define (save args)
  (let ((nopea-file (build-path (home-directory)
                                ".nopea"))
        (name (cadr args))
        (dir  (caddr args)))
    (cond
      ((not (file-exists? nopea-file))
       (call-with-output-file nopea-file
         (lambda (o) (write '() o)))
       (save-ref-to-file nopea-file
                         name dir))
      (else
        (save-ref-to-file nopea-file
                          name dir)))))
