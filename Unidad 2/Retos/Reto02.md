### Transforma el programa en alto nivel anterior para que utilice un ciclo for en vez de un ciclo while.
Ciclo While:
```c++
int main()
{
    int i = 1;
    int sum = 0;
    while (i <= 100){
        sum += i;
        std::cout<<sum;
        i++;
    }
    return 0;
}    
```
Ciclo For:
```c++
int main()
{
    int sum = 0;
    
    for (int i = 1;i <= 100; i++){
        sum += i;
    }
    std::cout<<sum;
    return 0;
}
```