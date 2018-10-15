PROGRAM Array_Or_Record
    TYPE record
        INTEGER :: a
        CHARACTER :: b
    END TYPE record

    INTEGER :: arr(10)
    TYPE(record) :: r

    ! Assign to Array
    DO i = 1, 10
        arr(i) = i
    END DO

    ! Print Array Data
    DO i = 1, 10
        Print *, arr(i)
    END DO
    !      1
    !      2
    !      3
    !      4
    !      5
    !      6
    !      7
    !      8
    !      9
    !     10

    ! Assing to Record
    r = record(1, 'a')

    ! Print Record Data
    Print *, 'r%a : ', r%a
    Print *, 'r%b : ', r%b
    ! r%a :            1
    ! r%b : a

END PROGRAM Array_Or_Record
