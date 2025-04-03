### Ahora vas a usar un puntero para leer la posición de memoria a la que este apunta, es decir, vas a leer por medio del puntero la variable cuya dirección está almacenada en él.
```C++
int main()
{
    int a = 10;
    int b = 5;
    int *p;
    p = &a;
    b = *p;
    std::cout << b;

    return 0;
}
```
En este programa, `b = *p` hace que b almacene los datos de a, ya que utilizamos `*p`, haciendo que nos estemos refiriendo a la variable del puntero, mas nó el puntero en si