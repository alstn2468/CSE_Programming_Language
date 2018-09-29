module mult
contains
    subroutine matrixmul(first, second, multiply, status)
        implicit none
        real (kind = 8), intent(in) :: first(:,:)
        real (kind = 8), intent(in) :: second(: ,:)
        real (kind = 8), intent(out) :: multiply(:,:)
        integer (kind = 4), intent(out) :: status
        integer (kind = 4) :: i, j, k, firstSize(2), secondSize(2)
        real (kind = 8) :: sum

        firstSize(2) = size(first(1,:))
        firstSize(1) = size(first(:,1))
        secondSize(2) = size(second(1,:))
        secondSize(1) = size(second(:,1))

        multiply = 0

        if (firstSize(2) .ne. secondSize(1)) then
            status = 1
        else
            do i = 1, firstSize(1)
                do j = 1, secondSize(2)
                    sum = 0
                    do k = 1, firstSize(2)
                        sum = sum + first(i,k) * second(k,j)
                    end do
                    multiply(i, j) = sum
                end do
            end do
            status = 0
        end if
    end subroutine

end module
