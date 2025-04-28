@16384 
D=A // copia el numero 16384 en D
@16 
M=D // almacena el numero en RAM16
@24576 
D=M // copia los datos almacenados en la posicion 24576
@19 
D;JNE //si los datos copiados no son iguales a 0, salta a la line 19
@16 
D=M // copia los datos de R16
@16384
D=D-A // resta 16384 al numero copiado
@4 
D;JLE // salta a ROM4 si la resta es menor o igual a 0
@16 
AM=M-1 // toma los datos almacenados en RAM16, resta 1, los almacena en la posicion RAM 16 e inmediatamente apunta a la dirección igual al resultado de esta resta
M=0 
@4 
0;JMP 
@16 
D=M 
@24576 
D=D-A 
@4 
D;JGE 
@16 
A=M 
M=-1
@16
M=M+1
@4
0;JMP 
