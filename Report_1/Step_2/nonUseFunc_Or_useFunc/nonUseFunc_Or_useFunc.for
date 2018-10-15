PROGRAM NonUseFunc_Or_UseFunc
    IMPLICIT NONE

    INTEGER :: a, b

    a = 0
    b = 0

    DO i = 1, 10
        a = a + i
    EMD DO

    CALL useFunc(b)

    Print *, 'useFunc : ', b, ", nonUseFunc : ", a
    ! useFunc : 55, nonUseFunc : 55

    CONTAINS

    SUBROUTINE useFunc(B)
        INTEGER, INTENT(IN) :: B

        DO i = 1, 10
            B = B + i
        END DO
    END SUBROUTINE
    
END PROGRAM NonUseFunc_Or_UseFunc
