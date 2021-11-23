# Entrada: testcases, longitud del arreglo, arreglo permutación
# Salida: profundidad de cada nodo en orden de la entrada del arreglo
# Formación del arbol y resultado: 
# 1 Paso: encontrar el número mayor del arreglo
# 2 Paso: separar los elementos del arreglo con base del número mayor, de los elementos de
# izquierda de este, y los elementos de la derecha
# 3 Paso: en cada conjunto separado, realizar el paso 1 y 2 hasta que no se pueda dividir
# Nota: si no hay elementos, se descarta(No se toma en cuenta).
# 4 Paso: buscar el nivel de profundidad de cada nodo y relacionarlo con el arreglo inicial
# 5 Paso: Mostrar en pantalla los niveles de profundidad de cada arreglo dado

# Más ejemplos de casos
# 1 Caso (Caso cargado a la derecha): 7,5,6,3,4,2,1
# Nivel 0
# 1 Paso: 7
# 2 Paso: Izquierda--> .Derecha-->5,6,3,4,2,1
# 3 Paso: Para Izquierda: ¿Es solo un elemento? No hay elemento ---> Se descarta 
# Para Derecha: ¿Es solo un elemento? No ---> volvemos a 1 Paso con entrada derecha 
# Nivel 1, Derecha
# 1 Paso: 6
# 2 Paso: Izquierda--> 5 .Derecha-->3,4,2,1
# 3 Paso: Para Izquierda ¿Es solo un elemento? Si --->Termina. 
# Para Derecha: ¿Es solo un elemento? No ---> volvemos a 1 Paso con entrada derecha
# Nivel 2, Derecha
# 1 Paso: 4
# 2 Paso: Izquierda-->3 .Derecha-->2,1
# 3 Paso: Para Izquierda: ¿Es solo un elemento? Si --->Termina.
# Para Derecha: ¿Es solo un elemento? No ---> volvemos a 1 Paso con entrada derecha
# Nivel 3, Derecha
# 1 Paso: 2
# 2 Paso: Izquierda--> .Derecha-->1
# 3 Paso: Para Izquierda: ¿Es solo un elemento? No hay elemento ---> Se descarta
# Para Derecha: ¿Es solo un elemento? Si --->Termina.
# 4 Paso: Nivel 0: 7, Nivel 1: 6, Nivel 2: 4, Nivel 3: 2
# 5 Paso: 0, , 1, , 2, 3,  Sin conocer 5, 3, 1
# Salida correcta: No
# Observación: Para los niveles sin conocer, cada que se detecte que solo es un elemento, 
# relacionar con el siguiente nivel ese elemento, entonces para nivel 2: 5 nivel 3: 3, 
# nivel 4: 1 y la salída sería: 0, 2, 1, 3, 2, 3, 4
# Salida correcta con observación: Si 
# 2 Caso (Zig-zag): 4,2,5,1,3 
# Nivel 0
# 1 Paso: 5
# 2 Paso: Izquierda-->4,2 .Derecha-->1,3
# 3 Paso: Para Izquierda: ¿Es solo un elemento? No ---> volvemos a 1 Paso con entrada izquierda 
# Para Derecha: ¿Es solo un elemento? No ---> volvemos a 1 Paso con entrada derecha 
# Nivel 1, Izquierda
# 1 Paso: 4
# 2 Paso: Izquierda--> .Derecha-->2
# 3 Paso: Para Izquierda ¿Es solo un elemento? No hay elemento ---> Se descarta 
# Para Derecha: ¿Es solo un elemento? Si ---> Termina y se relaciona con el siguiente nivel
# Nivel 1, Derecha
# 1 Paso: 3
# 2 Paso: Izquierda-->1 .Derecha-->
# 3 Paso: Para Izquierda: ¿Es solo un elemento? Si --->Termina y se relaciona con el siguiente nivel
# Para Derecha: ¿Es solo un elemento? No hay elemento ---> Se descarta
# 4 Paso: Nivel 0: 5, Nivel 1: 4,3, Nivel 2: 2,1
# 5 Paso: 1, 2, 0, 2, 1
# Salida correcta: Si

def permutationTransformation(a,n,nivel)
    # Observación
    if n == 1
        return nivel
    end
    #Pre paso: crear el arreglo del arbol "d" y los arreglos derecha, izquierda
    d = []
    izquierda, derecha = []
    # 1 Paso
    mayor = buscarMayorNumero(a,n)
    # 2 Paso
    izquierda, derecha = separarElementosArreglo(a,n,mayor)
    # 3 Paso
    if izquierda.length>0
        izquierda = permutationTransformation(izquierda,izquierda.length,nivel+1)
    end
    if derecha.length>0
        derecha = permutationTransformation(derecha,derecha.length,nivel+1)
    end
    # 4 Paso
    d = buscarNiveles(izquierda,nivel,derecha)
    return d
end

def buscarNiveles(izquierda,mayor,derecha)
    d = []
    if izquierda.class == Integer
        d.push(izquierda)
    else
        for i in(0..izquierda.length-1)
            d.push(izquierda[i])
        end
    end
    d.push(mayor)
    if derecha.class == Integer
        d.push(derecha)
    else
        for i in(0..derecha.length-1)
            d.push(derecha[i])
        end
    end
    return d
end

def separarElementosArreglo(a,n,mayor)
    izquierda = []
    derecha = []
    #Para izquierda
    for i in(0..mayor-1)
        izquierda.push(a[i])
    end
    #Para derecha
    for i in(mayor+1..n-1)
        derecha.push(a[i])
    end
    return izquierda, derecha
end

def buscarMayorNumero(a,n)
    mayor = a[0]
    posicion = 0
    for i in(0..n-1)
        if a[i]>mayor
            mayor = a[i]
            posicion = i
        end
    end
    return posicion
end

def convertirAInteger(a,n)
    for i in(0..n-1)
        a[i] = Integer(a[i])
    end
    return a
end

def darFormatoDeSalida(d)
    resultado = ""
    if d.class == Integer
        resultado = d.to_s
    else
        for i in(0..d.length-1)
            resultado = resultado + d[i].to_s
            if i != d.length-1 
                resultado = resultado + " "
            end
        end
    end
    return resultado
end

# Variables
testcases = 0
n = 0
a = []
d = []
resultado = []

# Pre paso: Pedir los testcases, la longitud del arreglo y el arreglo
# testcases
testcases = Integer(gets.chomp)

for i in(0..testcases-1)
    #Longitud del arreglo
    n = Integer(gets.chomp)
    #Arreglo
    array = gets.chomp
    a = array.split(" ")
    a = convertirAInteger(a,n)
    d = permutationTransformation(a,n,0)
    resultado.push(darFormatoDeSalida(d))
end

resultado.each do |elements|
    puts elements
end 

