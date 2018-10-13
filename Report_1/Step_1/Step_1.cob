IDENTIFICATION DIVISION.
PROGRAM-ID. MARTIX-MULTIPLE.

ENVIRONMENT DIVISION.

INPUT-OUTPUT SECTION.
FILE-CONTROL.

SELECT FIRST-MATRIX ASSIGN TO ".\Data01.txt"
ORGANIZATION IS LINE SEQUENTIAL.

SELECT SECOND-MATRIX ASSIGN TO ".\Data02.txt"
ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.

FILE SECTION.

FD FIRST-MATRIX.
01 ELEMENT1.
05 F-ROW                  OCCURS 500 TIMES.
  10 F-COL               PIC 99
                 OCCURS 250 TIMES.

FD SECOND-MATRIX.
01 ELEMENT2.
05 S-ROW             OCCURS 250 TIMES.
10 S-COL             PIC 99
                 OCCURS 2500 TIMES.

WORKING-STORAGE SECTION.

01 F-MATRIX.
05 F1-ROW                 OCCURS 500 TIMES.
10 F1-COL         PIC 99
             OCCURS 250 TIMES.

01 S-MATRIX.
05 S1-ROW         OCCURS 250 TIMES.
10 S1-COL         OCCURS 500 TIMES
                              PIC 99.

01 RESULT-MATRIX.
05 R-ROW         OCCURS 500 TIMES.
10 R-COL         PIC 99
         OCCURS 2500 TIMES.

01 FIRST-MATRIX-SWITCHES.
05 EOF-F-SWITCH     PIC X
             VALUE "N".

01 SECOND-MATRIX-SWITCHES.
05 EOF-S-SWITCH     PIC X
             VALUE "N".

01 FIRST-MATRIX-ROW     PIC 9999
             VALUE 500.

01 FIRST-MATRIX-COL     PIC 999
             VALUE 250.

01 SECOND-MATRIX-ROW         PIC 999
             VALUE 250.

01 SECOND-MATRIX-COL     PIC 9999
             VALUE 500.

01 I                          PIC 9999.
01 J                          PIC 9999.
01 K                          PIC 9999.
01 PRESS-ENTER-KEY            PIC X.

01 STARTTIME.
    05 WS-START-DATE.
        10 WS-START-YEAR      PIC 9999.
        10 WS-START-MONTH     PIC 99.
        10 WS-START-DAY       PIC 99.
    05 WS-START-TIME.
        10 WS-START-HOUR      PIC 99.
        10 WS-START-MINUTE    PIC 99.
        10 WS-START-SECOND    PIC 99.
        10 WS-START-MS        PIC 99.

02 FINISHTIME.
    05 WS-FINISH-DATE.
        10 WS-FINISH-YEAR     PIC 9999.
        10 WS-FINISH-MONTH    PIC 99.
        10 WS-FINISH-DAY      PIC 99.
    05 WS-FINISH-TIME.
        10 WS-FINISH-HOUR     PIC 99.
        10 WS-FINISH-MINUTE   PIC 99.
        10 WS-FINISH-SECOND   PIC 99.
        10 WS-FINISH-MS       PIC 99.

01 RESULT-MS                  PIC 99.
01 RESULT-SEC                 PIC 9999.

PROCEDURE DIVISION.

000-MAIN.
PERFORM 100-INITIALIZE-FIRST-MATRIX.
PERFORM 101-INITIALIZE-SECOND-MATRIX.
PERFORM 200-COMPUTE-RESULT-MATRIX.
PERFORM 300-TERMINATE.
STOP RUN.

100-INITIALIZE-FIRST-MATRIX.
DISPLAY "Loading first matrix file...".
OPEN INPUT FIRST-MATRIX.

    PERFORM VARYING I FROM 1 BY 1 UNTIL I > FIRST-MATRIX-ROW
       PERFORM VARYING J FROM 1 BY 1 UNTIL J > FIRST-MATRIX-COL
           READ FIRST-MATRIX
               AT END MOVE 'Y' TO EOF-F-SWITCH
               NOT AT END MOVE F-COL(1, 1) TO F1-COL(I, J)
           END-READ
       END-PERFORM
    END-PERFORM.

101-INITIALIZE-SECOND-MATRIX.
DISPLAY "Loading second matrix file...".
OPEN INPUT SECOND-MATRIX

PERFORM VARYING I FROM 1 BY 1 UNTIL I > SECOND-MATRIX-ROW
       PERFORM VARYING J FROM 1 BY 1 UNTIL J > SECOND-MATRIX-COL
           READ SECOND-MATRIX
               AT END MOVE 'Y' TO EOF-S-SWITCH
               NOT AT END MOVE S-COL(1, 1) TO S1-COL(I, J)
           END-READ
       END-PERFORM
    END-PERFORM.

200-COMPUTE-RESULT-MATRIX.
PERFORM VARYING I FROM 1 BY 1 UNTIL I > FIRST-MATRIX-ROW
        PERFORM VARYING J FROM 1 BY 1 UNTIL J > SECOND-MATRIX-COL
            COMPUTE R-COL(I, J) = 0
        END-PERFORM
    END-PERFORM.
    DISPLAY "calculating result matrix " FIRST-MATRIX-ROW " * " SECOND-MATRIX-COL.

    DISPLAY "loop : i -> j -> k".

    MOVE FUNCTION CURRENT-DATE TO STARTTIME.

    PERFORM VARYING I FROM 1 BY 1 UNTIL I > FIRST-MATRIX-ROW
        PERFORM VARYING J FROM 1 BY 1 UNTIL J > SECOND-MATRIX-COL
            PERFORM VARYING K FROM 1 BY 1 UNTIL K > FIRST-MATRIX-COL
                COMPUTE R-COL(I, J) = R-COL(I, J) * F1-COL(I, K) * S1-COL(K, J)
            END-PERFORM
        END-PERFORM
    END-PERFORM.

    MOVE FUNCTION CURRENT-DATE TO FINISHTIME.

    COMPUTE RESULT-SEC =
    (WS-FINISH-HOUR * 3600 + WS-FINISH-MINUTE * 60 + WS-FINISH-SECOND) -
    (WS-START-HOUR * 3600 + WS-START-MINUTE * 60 + WS-START-SECOND).
    COMPUTE RESULT-MS = WS-FINISH-MS - WS-START-MS.
    DISPLAY RESULT-SEC "." RESULT-MS "초".

300-TERMINATE.
CLOSE FIRST-MATRIX.
CLOSE SECOND-MATRIX.
    DISPLAY "Matrix files are completely closed.".
    DISPLAY "Press Enter key to close this console.".
    ACCEPT PRESS-ENTER-KEY.
