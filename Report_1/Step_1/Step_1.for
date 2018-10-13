Program main
Integer i, j, k, fmrow, fmcol, smrow, smcol
Integer, Dimension(1000, 1000) :: fm
Integer, Dimension(1000, 1000) :: sm
Integer, Dimension(1000, 1000) :: res
Character anykey
REAL T1, T2

fmrow = 1000
fmcol = 1000
smrow = 1000
smcol = 1000

Open(10, file = 'Data01.txt', status='old')
Print *, 'Reading Data01.txt'
Do i = 1, fmrow
    Do j = 1, fmcol
        Read (10, *) fm(i, j)
    End Do
End Do
Close(UNIT = 10)

Open(20, file = 'Data02.txt', status='old')

Print *, 'Reading Data02.txt'
Do i = 1, smrow
    Do j = 1, smcol
        Read (20, *) sm(i, j)
    End Do
End Do
Close(UNIT = 20)

Print *, 'Calculating fm * sm.. loop k->j->i'
CALL CPU_TIME(T1)

Do k = 1, smrow
    Do j = 1, smcol
        Do i = 1, fmrow
            res(i, j) = res(i, j) + (fm(i, k) * sm(k, j))
        End Do
    End Do
End Do

CALL CPU_TIME(T2)

Print *, 'Calculate Time : ', T2-T1, 'Second'

Print *, 'Press Any Key and Enter Key'
Read *, anykey

End Program
