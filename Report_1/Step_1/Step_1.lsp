;matrix multiplication
;two inputs of the mxn nxm
;as list of lists
;using apply and mapcar

(defun gets(x lst)
    ( if (= x 0) (car lst)
         (gets (- x 1) (cdr lst) )
     )
)

(defun getrow(x matrix)
    (gets x matrix)
 )

(defun getcol(x matrix)
    (if (null matrix) nil
     (append (list (gets x (car matrix) )) (getcol x (cdr matrix) ))
        )
    )


(defun helper(line col) (apply #'+ 0 (mapcar #'* line col) ))

(defun helper2(line matrix x) (if (= -1 x) nil (append (list (helper line (getcol (- (length matrix) x) matrix))) (helper2 line matrix (- x 1))) ))


(defun matrixmul(mat1 mat2 x)
    (if (= x 0) nil (append (list (helper2 (getrow (- (length mat1) x ) mat1) mat2 (length mat2))) (matrixmul mat1 mat2 (- x 1) ) ) )
)

(defun matmul (mat1 mat2) (matrixmul mat1 mat2 (length mat1) ) )

(print (matmul '((7 4 9) (8 1 5) (8 1 5))  '((7 4 9) (8 1 5) (8 1 5))  ))
