; Recursion
(defun power_recu (x y)
            (if (= y 0) 1
                (* x (power_recu x (- y 1)))))

(print (power_recu 3 4))
; 81

(defun power_iter (x y)
            (let ((result 1))
               (dotimes (count y result)
                  (setf result (* x result)))))

(print (power_iter 3 4))
; 81
