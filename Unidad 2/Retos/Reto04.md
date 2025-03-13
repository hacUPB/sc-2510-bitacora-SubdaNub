```C++
int main()
{
    int a = 10;
    int *p;
    p = &a;
    *p = 20;
    std::cout<<a;

    return 0;
}
```
#### ¿Cómo se declara un puntero en C++?
utilizando `*` antes del nombre de la variable

#### ¿Cómo se define un puntero en C++?
cuando se utiliza `&` antes de la variable, se obtiene la dirección de la variable, cuando ese dato es almacenado en un puntero, ahi es cuandos se define.

#### ¿Cómo se almacena en C++ la dirección de memoria de una variable?
Primero se declara un puntero `*p`, luego obtenemos la dirección de la variable `&a` y se almacena `p = &a`

#### ¿Cómo se escribe el contenido de la variable a la que apunta un puntero?
Utilizando `*p`, nos referimos a la variable a la que p está apuntando entonces `*p = 20` reescribirá los datos de la variable.