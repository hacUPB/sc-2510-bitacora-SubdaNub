//if ( (D - 7) == 0) goto a la instrucción en ROM[69]
@d
D=M
@7
D=M-A
@69
D;JEQ