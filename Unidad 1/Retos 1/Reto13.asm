//if R0 >= 0 then R1 = 1
//else R1 = –1
//(LOOP)
//goto LOOP
        @R0
        D=M
        @IF
        D;JGT
        D;JEQ
        @ELSE
        D;JLT
(IF)
        @R1
        M=1
        @LOOP
        0;JMP
(ELSE)  
        @R1
        M=-1
        @LOOP
        0;JMP
(LOOP)
        @LOOP
        0;JMP