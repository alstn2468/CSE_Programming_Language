PROGRAM Recursion_Or_Iteration
    INTEGER :: iteration
    REAL :: recursion

    iteration = 0

    DO i = 1, 10
        iteration = iteration + i
    END DO

    recursion = recu(10)

    Print *, 'Iteration : ', iteration
    Print *, 'Recursion : ', recursion
    ! Iteration : 55
    ! Recursion : 55
END PROGRAM Recursion_Or_Iteration

REAL RECURSIVE FUNCTION recu(N) RESULT(N_recu)
    INTEGER, INTENT(IN) :: N

    IF (N > 0) THEN
        N_recu = N + recu(N - 1)

    ELSE
        N_recu = 0

    END IF
END FUNCTION recu
