#include <stdio.h>
#include <stdlib.h>

int** crearMatriz(int n){
    int* values = calloc(n*n, sizeof(int));
    int** matriz = malloc(n*sizeof(int*));
    for (int i=0; i<n; ++i)
    {
        matriz[i] = values + i*n;
    }
    int numero = 0;
    for(int i=0; i<n; i++){
        for(int j = 0; j<n; j++){
            scanf("%d",&matriz[i][j]);
        }
    }
    return matriz;
}

int** multiplicacionMatricesAB(int** a, int** b, int n){
    int* values = calloc(n*n, sizeof(int));
    int** c = malloc(n*sizeof(int*));
    for (int i=0; i<n; ++i)
    {
        c[i] = values + i*n;
    }
    for(int i=0; i<n; i++){
        for(int j = 0; j<n; j++){
            c[i][j] = 0;
            for(int k = 0; k<n; k++){
                c[i][j] = c[i][j] + (a[i][k]*b[k][j]);
            }
        }
    }
    return c;
}

void imprimirMatriz(int** matriz, int n){
    for(int i=0; i<n; i++){
        for(int j = 0; j<n; j++){
            printf("%d,", matriz[i][j]);
        }
    }
}

int main(){
    int n;
    printf("Ingrese n");
    scanf("%d",&n);

    int** a;
    int** b;
    int** c;
    printf("Ingrese datos matriz A");
    a = crearMatriz(n);
    printf("Ingrese datos matriz B");
    b = crearMatriz(n);
    
    c = multiplicacionMatricesAB(a,b,n);
    
    imprimirMatriz(c,n);
    
    return 0;
}
