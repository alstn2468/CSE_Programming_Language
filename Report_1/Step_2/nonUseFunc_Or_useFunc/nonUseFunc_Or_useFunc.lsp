; useFunc
(defun sum (n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (T (+ n (sum (- n 1))))))

(print (sum 10))
; 55

; nonUseFunc
(print (+ 1 2 3 4 5 6 7 8 9 10))
; 55
