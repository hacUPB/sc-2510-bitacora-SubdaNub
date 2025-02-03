```asm
// i = 1000
@1000
D=A
@i
M=D
(LOOP)
// if (i == 0) goto CONT
@i
D=M
@CONT
D;JEQ
// i = i - 1
@i
M=M-1
// goto LOOP
@LOOP
0;JMP
(CONT)
```
¿Qué hace este programa?
-Este programa se encarga de restar el valor 1000 almacenado en i, subtraer 1, y repetir hasta que sea 0

¿En qué memoria está almacenada la variable i? ¿En qué dirección de esa memoria?
-i está almacenada en la RAM @16

¿En qué memoria y en qué dirección de memoria está almacenado el comentario //i = 1000?
-El compilador de lenguaje de maquina se encarga de eliminar los comentarios antes de que la maquina los lea, por ende no quedan almacenadas en ninguna dirección

¿Cuál es la primera instrucción del programa anterior? ¿En qué memoria y en qué dirección de memoria está almacenada esa instrucción?
-La primera instrucción se encarga de ubicar A en la posición de la RAM @10000, esta instrucción está almacenada en la posición 0 de la ROM

¿Qué son CONT y LOOP?
-Son variables con nombres especificos para distinguir su proposito, LOOP es la posición donde comienza la resta de i y se revisa que su valor sea igual a 0
mientras que CONT es la posición a la que se debe dirigir solo si i cumple la condicion i = 0

¿Cuál es la diferencia entre los símbolos i y CONT?
-Son notaciones comunmente usadas para un proposito, i como iteración, y CONT como contador