### Vas a proponer una posible traducción a lenguaje ensamblador
```C++
#include <iostream>

int suma(int a, int b) {
   int var = a + b;
   return var;
}


int main() {
   int c = suma(6, 9);
   std::cout << "El valor de c es: " << c << std::endl;
   return 0;
}
```
```asm
    @main
    D=0     // limpiar el registro D como precaución
    0;JMP   // int main()
(suma)
    @6
    D=A
    @a
    M=D     // int a = 6
    @9
    D=A
    @b
    M=D     // int b = 9
    @b
    D=M
    @a
    D=D+M
    @var
    M=D     // int var = a + b
    @var
    D=M     // return var
    @main
    0;JMP
(main)
    @suma
    D;JEQ   // si D esta vacio, ir a suma
    @c
    M=D     // int c = var
    @cout
    0;JMP
(cout)
    // imprime en pantalla "el valor de c es:"
    // imprimir el dato guardado en c
    @end
    0;JMP
(end)
    @end
    0;JMP

```