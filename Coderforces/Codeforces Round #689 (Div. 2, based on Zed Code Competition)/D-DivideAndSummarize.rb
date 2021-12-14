#Entrada: testscases, la longitud del arreglo y el número total de prettiness test, 
#el arreglo de longitud n previamente dado, x números de prettiness 
#cuyo total de números es previamente dado.
# Salida: YES en caso de que cumpla ese prettiness, NO en caso contrario

#Ejemplo 1:
#Entrada: 7 5
# 3 4 6 1 3 5 6
# 9
# 5
# 19
# 7
# 2
#Salida: YES (Tomar derecha a[4,5,6,6]. tomar izquierda a[4,5], la sumatoria es 9)
#Observación: desde el principio se puede manejar con el arreglo ordenado ascendentemente
# YES (Tomar derecha a[4,5,6,6.]. tomar izquierda a[4,5], tomar derecha a[5] y la sumatoria es 5)
# NO (Tomar derecha a[4,5,6,6]. la sumatoria total es de 21 por lo que para 19 no existe)
# YES (Tomar izquierda a[1,3,3]. la sumatoria es 7)
# NO (Tomar izquierda a[1,3,3]. la división de ese arreglo da de sumatoria 6 y 1)
#Observación: las sumas siempre serán las mismas para los prettiness asociados, se puede 
# calcular todas las sumas y luego hacer la comparativa y guardar las respuestas para al final ser mostradas 

#Ejemplo 2:
#Entrada: 4 4
# 7 7 7 7
# 28
# 7
# 14
# 21
#Salida: YES (la sumatoria es 28)
# NO (No se puede dividir cuando ya son números iguales)
# NO (No se puede dividir cuando ya son números iguales)
# NO (No se puede dividir cuando ya son números iguales)

#Variables
correctAnswers = [] 
a = []
testcases = 0
n = 0
x = 0
prettiness = []
$sumatorias = []

def DivideAndSummarize(l,r,a)
    sum = 0
    mid = (a[l] + a[r])/2
    for i in(l..r)
        sum += a[i]
    end
    $sumatorias.push(sum)

    validatePosition = -1
    for i in(l..r)
        if a[i] <= mid
            validatePosition = i
        else
            break
        end
    end

    if validatePosition == -1 || validatePosition == r
        return
    end

    DivideAndSummarize(l,validatePosition,a)
    DivideAndSummarize(validatePosition+1,r,a)
end

#Prepaso: recibimos testcases
testcases = Integer(gets.chomp)

for i in(0..testcases-1)
    $sumatorias = []
    #Prepaso: recibimos n y x
    auxiliar = gets.chomp
    aux = auxiliar.split(" ")
    n = aux[0].to_i
    x = aux[1].to_i
    #Prepaso: recibimos a
    a = []
    auxiliar = gets.chomp
    a = auxiliar.split(" ")
    aux = []
    a.each do|c|
        aux.push(c.to_i)
    end
    a = aux.sort
    #Llamamos a nuestra función solución
    DivideAndSummarize(0,n-1,a)
    #Buscamos los prettinnes en las sumatorias y guardamos en resultado
    #Prepaso: recibimos prettiness
    prettiness = []
    for j in(0..x-1)
        if $sumatorias.include?(Integer(gets.chomp))
            correctAnswers.push("YES")
        else
            correctAnswers.push("NO")
        end
    end
end

puts correctAnswers



