# Actividad 1
#### ¿Qué es un computador digital moderno?
Es una máquina que procesa datos de entrada y los almacena, para luego ejecutar una serie de comandos y dar sus resultados en una salida

#### ¿Cuáles son sus partes?
- Unidad Central de Procesamiento (CPU)
- Memoria ROM (Read Only Memory)
- Memoria RAM (Random Access Memory)
- Perifericos de entrada/salida
- Disco duro
- Tarjeta madre
- Fuente de alimentación

# Actividad 2
#### ¿Qué es entonces un programa?
Es la serie de comandos que le ordenan al computador lo que debe hacer

#### ¿Qué es un lenguaje ensamblador?
Es el lenguaje que explica paso por paso los comandos que el computador debe ejecutar, y es lenguaje que usamos para comunicarnos con el computador

#### ¿Qué es lenguaje de máquina?
Es el lenguaje binario y es el que el computador entiende, cualquier comando escrito en lenguaje ensamblador es traducido a lenguaje maquina para que pueda ser ejecutado

# Actividad 3
#### ¿Qué son PC, D y A?
- PC: los Contadores de Programa (Program Counters) se ubican en la ROM y son las instrucciónes que el computador debe ejecutar
- D: el registro de datos (Data Register) se encarga de almacenar un dato, ya sea para ser movido o para ser comparado
- A: el registro de dirección (Address Register) es el que se encarga de dirigir D a las distintas posiciones de la RAM

#### ¿Para qué los usa la CPU?
los utiliza para hacer calculos basados en datos ingresados, almacena estos datos y sus calculos en la RAM y luego es capaz de dar resultados como datos de salida

# Actividad 4
#### Escribe un programa en lenguaje ensamblador que guarde en la posición 32 de la RAM un 100.

```asm
@100
D=A
@32
M=D
```