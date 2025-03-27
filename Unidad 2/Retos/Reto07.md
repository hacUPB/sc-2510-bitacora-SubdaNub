### Traduce este programa a lenguaje ensamblador:
```c++
int a = 10;
int b = 5;
int *p;
p = &a;
b = *p;
```
```asm
    @10
    D=A
    @a
    M=D     // int a = 10;
    @5
    D=A
    @b
    M=D     // int b = 5;
    @p      // int *p;
    @a
    D=A
    @p
    M=D     // p = &a;
    @p
    A=M
    D=M
    @b
    M=D     // b = *p;
```