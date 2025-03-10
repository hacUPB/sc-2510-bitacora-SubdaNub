### Escribe un programa en lenguaje ensamblador que implemente el programa anterior
Programa que revisa si en algun momento de la suma de los primeros 100 numeros naturales, un numero ingresado es igual a una de estas sumas
```asm
    @10
    D=A
    @input
    M=D     // Consideremos 10 como numero ingresado
    @bool   // Encargado de responder la incognita
    D=0
    @i 
    M=1     // int i = 1;
    @sum
    M=0     // int sum = 0;
    @While
    0;JMP
(While)
    @i
    D=M
    @100
    D=D-M
    @End
    D;JGT   // While (i <= 100)
    @i
    D=M
    @sum
    M=M+D   // sum += i;
    D=M
    @input
    D=D-M
    @True
    D;JEQ   // compara el numero ingresado con el resultado de la suma
    @i
    M=M+1   // i++;
    @While
    0;JMP   // repite la suma y la comparacion
(True)
    @bool
    M=1     // Si 10 es resultado de alguna de las sumas, bool cambiará a 1
    @End
    0;JMP
(End)
    @End
    0;JMP
```