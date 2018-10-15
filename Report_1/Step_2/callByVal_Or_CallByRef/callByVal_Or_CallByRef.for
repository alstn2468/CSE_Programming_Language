PROGRAM CallByVal_Or_CallByRef
    INTEGER :: a, b

    a = 1
    b = 2

    Print *, 'a : ', a, ', b : ',  b
    ! a :            1 , b :            2

    CALL Swap(a, b)

    Print *, 'a : ', a, ', b : ',  b
    ! a :            2 , b :            1

    CONTAINS
    SUBROUTINE Swap(A, B)
    INTEGER, INTENT(INOUT) :: A, B
    INTEGER :: TEMP

    TEMP = A
    A = B
    B = TEMP

    END SUBROUTINE
END PROGRAM CallByVal_Or_CallByRef
