# Actividad 1
#### ¿Qué es la entrada-salida mapeada a memoria?
Son espacios de memoria dedicados a recibir datos de perifericos donde el Hardware y el computador intercambian instrucciones.

#### ¿Cómo se implementa en la plataforma Hack?
El computador Hack tiene dos perifericos designados para el teclado y una pantalla, cada tecla tiene un numero asociado y cuando se presiona, envia su respectivo numero al espacio de memoria designado al teclado (RAM 24576)

#### Inventa un programa que haga uso de la entrada-salida mapeada a memoria.
```asm
(Key)
    @24576
    D=M     // lee el teclado
    @97
    D=D-A
    @White  //si "a" es presionada, pinta el pixel blanco
    D;JEQ
    @3
    D=D-A
    @Black  // si "d" es presionada, pinta el pixel negro
    D;JEQ
    @28
    D=D-A
    @New    // si enter es presionado, vuelve al primer pixel
    D;JEQ
    @Key
    0;JMP   // vuelve a leer el teclado
(New)
    @i      // contador de pixeles
    M=0     // el contador de pixeles vuelve a empezar
    @Key
    0;JMP
(White)
    @i
    D=M
    @16384
    A=A+D   // recorre la pantalla pixel por pixel
    M=0     // pinta de blanco
    @i
    M=M+1   // avanza el contador de pixeles en 1
    @Key
    0;JMP
(Black)
    @i
    D=M
    @16384
    A=A+D   // recorre la pantalla pixel por pixel
    M=1     // pinta de negro
    @i
    M=M+1   // avanza el contador de pixeles en 1
    @Key
    0;JMP
```

# Actividad 3

```asm
// (Key)
    @24576
    D=M     // lee la tecla
    @Erase
    D;JEQ   // si no hay tecla presionada, borra la pantalla
    @100
    D=D-A   
    @Draw
    D;JEQ   // si la tecla es "d", comienza a dibujar
    @Key
	0;JMP   // vuelve a leer la tecla
// (Erase)
// (Draw)
	// put bitmap location value in R12
	// put code return address in R13
	@SCREEN
	D=A
	@R12
	AD=D+M
	// row 5
	@8176 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	@24588 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	@32766 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	@32766 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	M=1
	AD=A+1 // D holds addr
	M=1
	// row 10
	D=A // D holds previous addr
	@31
	AD=D+A
	@14393 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	M=1
	// row 11
	D=A // D holds previous addr
	@31
	AD=D+A
	@10297 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	M=1
	// row 12
	D=A // D holds previous addr
	@31
	AD=D+A
	@14649 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	M=1
	// row 13
	D=A // D holds previous addr
	@31
	AD=D+A
	@31870 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	@24565 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	AD=A+1 // D holds addr
	M=1
	// row 15
	D=A // D holds previous addr
	@31
	AD=D+A
	@16377 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	M=1
	// row 16
	D=A // D holds previous addr
	@31
	AD=D+A
	@5457 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	AD=A+1 // D holds addr
	M=1
	// row 17
	D=A // D holds previous addr
	@31
	AD=D+A
	@12314 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 18
	D=A // D holds previous addr
	@32
	AD=D+A
	@12312 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 19
	D=A // D holds previous addr
	@32
	AD=D+A
	@4064 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// return
	@R13
	A=M
	D;JMP
(end)
    @END
    0;JMP
```