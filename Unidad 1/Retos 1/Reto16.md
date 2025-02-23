//      int[] arr = new int[10];
//      int sum = 0;
//      for (int j = 0; j < 10; j++) {
//          sum = sum + arr[j];
//      }

```asm

        @160
        D=A
        @arr
        M=D         //direccion del array = 160
        @10
        D=A
        @arrS       
        M=D         //tamaño del array = 10
        @sum
        M=0             //sum = 0
        @j
        M=0         //int j=0
(FOR)
        @j
        D=M
        @arr
        A=M+D
        D=M
        @sum
        M=M+D           //sum = sum + arr[j]
        @j
        D=M
        @10
        D=M-D           //j < 10
        @j 
        M=M+1           //j++
        @FOR
        D;JLT
(END)
        @END
        0;JMP
```
Este programa crea un vector con 10 espacios de tamaño, luego crea una variable acumuladora
y por ultimo crea un for que se encarga de recorrer todo el vector y sumar la información dentro de cada espacio de la variable

La direccion base de arr es R16 debido a que desde aqui empiezan los espacios de memoria dedicados a las variables en este sistema

la direccion base de sum es R17 debido a que es el segundo espacio de memoria disponible dentro de los espacios dedicados a variables

La direccion base de j es R18 debido a que es la tercera variable creada y queda en el 3er espacio de memoria disponible
