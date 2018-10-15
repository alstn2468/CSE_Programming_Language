PROGRAM Array_Or_Record
    INTEGER :: arr(10)
    TYPE record
        INTEGER :: a
        CHARACTER :: b
    END TYPE record

    ! Assign to Array
    DO i = 1, 10
        arr(i) = i
    END DO

    ! Print Array Data
    DO i = 1, 10
        Print *, arr(i)
    END DO
    ! 1
    ! 2
    ! 3
    ! 4
    ! 5
    ! 6
    ! 7
    ! 8
    ! 9
    ! 10

    ! Assing to Record
    TYPE(record) r
    r = record(1, 'a')

    ! Print Record Data
    Print *, 'r%a : ' + r%a
    Print *, 'r%b : ' + r%b
    ! 1
    ! a

END PROGRAM
