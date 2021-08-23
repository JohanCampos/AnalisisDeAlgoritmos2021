#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    //Declaracion de variables a utilizar
    int randomSign;
    int *numerosAleatorios;
    int intervalo;
    int auxiliar;
    srand(time(NULL));


    printf("Ingrese la cantidad de numeros que quiera generar y ordenar de forma ascendente (valor mínimo 1, máximo 10,000)\n");
    scanf("%d", &intervalo);
    
    //Condicion de cantidad de numeros máxima y mínima
    if(intervalo == 1){
        printf("Orden ascendente de los numeros: %i", intervalo);
    }
    else if(intervalo > 1 && intervalo <= 10000){
        //Cumple la condición
        
        numerosAleatorios = (int *)malloc(sizeof(int)*intervalo);
        
        //Generación de numeros

        //1.-Condición de repetición for con el numero de intervalo
        for(int i = 0; i < intervalo; i++){
            randomSign = (rand() % 2); //0 = negativo, 1 = positivo
            //2.- Guardar los numeros en un array dinámico
            if(randomSign == 0){
                numerosAleatorios[i] = rand() * -1;
            }else if(randomSign == 1){
                numerosAleatorios[i] = rand();
            }
        }
        
        //Ordenar numeros
        
        //1.-Recorrer arreglo n veces * n veces
        for(int i = 0; i < intervalo; i++){
            for(int j = 0; j < intervalo; j++){
                //condicion si el numero anterior es menor al posterior, lo intercambiamos de lugar
                if(numerosAleatorios[j]>numerosAleatorios[j+1]){
                    auxiliar = numerosAleatorios[j];
                    numerosAleatorios[j] = numerosAleatorios[j+1];
                    numerosAleatorios[j+1] = auxiliar;
                }
            }
        }
        for (int i = 0; i < intervalo; i++){
            printf("%i\n",numerosAleatorios[i]);
        }
    }
    free(numerosAleatorios);
    return 0;
}