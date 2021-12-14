=begin
Entrada: 4 enteros. n(longitud del arreglo total = 2^n), 
k(cantidad de posiciones), A, B(ambas constantes para hacer calculos).    
intervalo de los enteros: 1<=n<=30; 1<=k<=10^5; 1<=A,B<=10^4
k enteros de las posiciones ocupadas a1,a2,a3,...ak (1<=ai<=2^n)
Salida: La cantidad mínima de costo de las divisiones realizadas
Formula: Para un solo elemento: costo = A
Para 2 o más elementos: costo = B*cantidadDeEspaciosOcupadosDelArregloEnCuestion*longitudDelArregloEnCuestion
=end

=begin
    CasoPrueba 1 (Todos los lugares ocupados y A siendo menor a B)
    Entrada: 2 4 2 3
             1 2 3 4
    Operaciones:  Sin divisiones: 3*4*4 = 48
                  Una división: 3*2*2 + 3*2*2 = 24
                  Dos divisiones: 3 + 3 + 3*2*2 = 18
                  Tres divisiones: 3 + 3 + 3 + 3 = 12
    Salida: 8
    Observación: La posición ocupada cuando está sola, equivale a B
=end
=begin
    CasoPrueba 2 (Un lugar ocupado lo más cercano al centro y A siendo mayor a B)
    Entrada: 3 1 4 2
             4
    Operaciones:  Sin divisiones: 2*1*8 = 16
                  Una división: 2*1*4 + 4 = 12
                  Dos divisiones: 4 + 2*1*2 + 4 = 12
                  Tres divisiones: 4 + 2 + 4 + 4 = 14
    Salida: 12
    Observación: Cuando no hay espacios ocupados, "no se puede" dividir (genera más costo)
=end
=begin
    CasoPrueba 3 (Todos los lugares ocupados y A siendo mayor a B)
    Entrada: 2 4 8 1
             1 2 3 4
    Operaciones:  Sin divisiones: 1*4*4 = 16
                  Una división: 1*2*2 + 1*2*2 = 8
                  Dos divisiones: 1 + 1 + 1*2*2 = 6
                  Tres divisiones: 1 + 1 + 1 + 1 = 4
    Salida: 8
    Observación: Si todos los lugares son ocupados, la salida debe ser B * 2^n
=end
=begin
    CasoPrueba 4 (Un lugar ocupado en el inicio y A siendo menor a B)
    Entrada: 3 1 1 8
             1
    Operaciones:  Sin divisiones: 8*1*8 = 64
                  Una división: 8*1*4 + 1 = 29
                  Dos divisiones: 8*1*2 + 1 + 1 = 18
                  Tres divisiones: 8 + 1 + 1 + 1 = 11
    Salida: 12
=end
=begin
    CasoPrueba 5 (Tres lugares ocupados(uno en inicio, uno lo más cercano al centro y el último al final) y A siendo mayor a B)
    Entrada: 3 3 10 3
             1 4 8
    Operaciones:  Sin divisiones: 3*3*8 = 72
                  Una división: 3*2*4 + 3*1*4 = 36
                  Dos divisiones: 3*1*2 + 3*1*2 + 3*1*4 = 24
                  Tres divisiones: 3*1*2 + 3*1*2 + 10 + 3*1*2 = 28
                  Cuatro divisiones: 3 + 10 + 3*1*2 + 10 + 3*1*2 = 35
                  Cinco divisiones: 3 + 10 + 3 + 10 + 10 + 3*1*2 = 48
                  Dejo de dividir
    Salida: 24 
=end