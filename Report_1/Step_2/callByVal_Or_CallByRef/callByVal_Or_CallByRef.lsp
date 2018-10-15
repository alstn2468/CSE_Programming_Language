(defun call_by_val (a b)
     (let ((tmp 0))
     (setf tmp a)
     (setf a b)
     (setf b tmp))
     (values a b))

(defmacro call_by_ref (a b)
    (let ((temp ,a))
        (setf ,a ,b)
        (setf ,b temp)))

(setf a 1)
(setf b 2)

(print a)
(print b)
; 1
; 2

(call_by_val a b)
(print a)
(print b)
; 1
; 2

(call_by_ref a b)
(print a)
(print b)
; 2
; 1
