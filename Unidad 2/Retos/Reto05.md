### Traduce este programa a lenguaje ensamblador:
```C++
    int a = 10;
    int *p;
    p = &a;
    *p = 20;
```
```asm
    @10
    D=A
    @a
    M=D     // int a = 10;
    @p      // int *p;
    @a
    D=A
    @p
    M=D     // p = &a;
    @20
    D=A
    @p
    A=M     // *p
    M=D     // *p = 20;
```