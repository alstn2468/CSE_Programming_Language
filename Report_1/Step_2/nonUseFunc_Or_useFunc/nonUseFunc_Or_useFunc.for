PROGRAM NonUseFunc_Or_UseFunc
    INTEGER :: a, b

    a = 0
    b = 0

    DO i = 1, 10
        a = a + i
    END DO

    CALL useFunc(b)

    Print *, 'useFunc : ', b, ", nonUseFunc : ", a
    ! useFunc :           55 , nonUseFunc :           55

    CONTAINS

    SUBROUTINE useFunc(B)
        INTEGER, INTENT(INOUT) :: B

        DO i = 1, 10
            B = B + i
        END DO
    END SUBROUTINE
END PROGRAM NonUseFunc_Or_UseFunc
