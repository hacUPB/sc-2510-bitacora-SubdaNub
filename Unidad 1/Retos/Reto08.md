```asm
        @var1
        D = M
        @var2
        D = D + M
        @var3
        M = D
```

Este codigo toma los datos de var1 y var2, los suma, y los almacena en var3
var1 está ubicada en ROM 16, var2 en ROM 17, Y var3 en ROM 18, debido a que son variables y por ende van ubicadas desde la posicion 16