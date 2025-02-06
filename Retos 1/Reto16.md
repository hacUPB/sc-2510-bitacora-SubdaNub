//      int[] arr = new int[10];
//      int sum = 0;
//      for (int j = 0; j < 10; j++) {
//          sum = sum + arr[j];
//      }

```asm

        @160
        D=A
        @arr
        M=D         //direccion del array es 160
        @10
        D=A
        @arrS       
        M=D         //array size = 10

        @sum
        M=0
(FOR)
        @j
        M=0
        @sum


        FOR
