```asm
// i = 1
@i
M=1
// sum = 0
@sum
M=0
// sum = sum + i
@i
D=M
@sum
M=D+M
// i = i + 1
@i
D=M+1
@i
M=D
```
Este programa crea una variable "i" y almacena el numero 1
luego crea otra variable "sum" y almacena el numero 0
luego, hace una suma entre sum e i y almacena el resultado sum
por ultimo aumenta la cantidad de i en 1

i y sum se ubican en la posicion 16 y 17 respectivamente

el comando i = i + 1 se puede optimizar como:
```asm
@i
M=M+1
```