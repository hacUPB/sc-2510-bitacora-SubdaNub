//En la posición R0 está almacenada la dirección inicial de una región de memoria. 
//En la posición R1 está almacenado el tamaño de la región de memoria.
//Almacena un -1 en esa región de memoria.

        @R1
        D=M-1
(LOOP)
        @R0
        A=M+D
        M=-1
        D=D-1
        @END
        D;JLT
        @LOOP
        0;JMP
(END)
        @END
        0;JMP
        
        
        