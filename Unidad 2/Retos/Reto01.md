### Escribe un programa en lenguaje ensamblador que sume los primeros 100 números naturales.
```c++
int main()
{
    int i = 1;
    int sum = 0;
    while (i <= 100){
        sum += i;
        i++;
    }
    std::cout<<sum;
    return 0;
}
```
```asm
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
    @i
    M=M+1   // i++;
    @While
    0;JMP   // repite While
(End)
    @End
    0;JMP
```

#### ¿Cómo están implementadas las variables i y sum?
En este programa, i es un contador de numeros, y sum es un acumulador, encargado de almacenar la suma de dichos numeros.

#### ¿En qué direcciones de memoria están estas variables?
En un computador de 16bits, las variables comienzan desde el espacio de memoria RAM16, por ende, i y sum estan ubicadas en RAM16 y RAM17 respectivamente

#### ¿Qué es entonces una variable?
Es un espacio de memoria en la RAM que se declara para ser exclusivamente usado cuando sea llamado

#### ¿Qué es la dirección de una variable?
Una dirección es donde se refiere a un espacio de memoria, la dirección de una variable tiene la caracteristica de estar ubicadas en ciertos espacios reservados para esta

#### ¿Qué es el contenido de una variable?
Es la información almacenada de manera arbitraria, donde nos encargamos de que solo lleguen datos de manera controlada