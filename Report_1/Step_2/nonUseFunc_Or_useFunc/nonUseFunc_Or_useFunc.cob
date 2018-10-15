IDENTIFICATION DIVISION.

PROGRAM-ID. nonUseFunc

ENVIRONMENT DIVISION.
DATA DIVISION.

WORKING-STORAGE SECTION.
77 N       PIC  9(3) VALUE ZERO.
77 I       PIC  9(3) VALUE ZERO.

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM ACCEPT-PARA.
    PERFORM PROCESS-PARA.
    STOP RUN.
ACCEPT-PARA.
    DISPLAY 'ENTER N VALUE'.
    ACCEPT N.
PROCESS-PARA.
    MOVE 1 TO I.
    PERFORM UNTIL I > N
        DISPLAY I
        ADD 1 TO I
    END-PERFORM.

END PROGRAM nonUseFUnc

identification division.
program-id. useFunc
data division.
01 x comp-1 value 1.
    88 done value 0.
01 y comp-1.
01 z comp-1.
01 mul_or_div pic x(8).

procedure division.
    perform until done
        display 'Enter first number (enter 0 to end the program): '
        accept value of x
        if not done
            display 'Enter second number (not 0 if dividing): '
            accept value of y
            display 'Enter mul or div: '
            accept value of mul_or_div
            if mul_or_div equals 'mul'
                call 'mul' using x y z
                display value 'Product is: ' z
            else
                call 'div' using x y z
                display value 'Quotient is: ' z.
    exit program.

identification division.
program-id. div.
data division.
linkage section.
01 a comp-1.
01 b comp-1.
01 c comp-1.
procedure division using a b c.
    compute c = a/b.
    exit program.
