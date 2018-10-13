(setq fmrow 1000) (setq fmcol 1000) (setq smrow 1000) (setq smcol 1000)
(defparameter fm (make-array '(1000 1000) :initial-element 0))
(defparameter sm (make-array '(1000 1000) :initial-element 0))
(defparameter res (make-array '(1000 1000) :initial-element 0))
(setq ffile (open "Data01.txt"))
(setq sfile (open "Data02.txt"))

(write-line "Reading Data01.txt")
( dotimes(i fmrow)
   ( dotimes (j fmcol)
      ( setf (aref fm i j) (parse-integer (read-line ffile)) )
   )
)

(close ffile)

(write-line "Reading Data02.txt")
( dotimes(i smrow)
   ( dotimes (j smcol)
       ( setf (aref sm i j) (parse-integer (read-line sfile)) )
    )
)
(close sfile)

(write-line "Calculating fm * sm... (loop i->j->k)")
(setf start (get-universal-time))

( dotimes(i fmrow)
    ( dotimes (j smcol)
        ( dotimes (k fmcol)
            ( setf (aref res i j) (+ (aref res i j) (* (aref fm i k) (aref sm k j))))
        )
    )
)

(setf finish (get-universal-time))
(format t "Calculate Time : ~D sec" (- finish start))
