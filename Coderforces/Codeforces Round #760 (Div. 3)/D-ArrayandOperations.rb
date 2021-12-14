testcases = Integer(gets.chomp)
resultados = []

for i in 0..testcases-1
    arreglo = gets.chomp
    aux = arreglo.split(" ")
    n = aux[0].to_i
    k = aux[1].to_i
    arreglo = gets.chomp
    aux = arreglo.split(" ")
    for j in 0..n-1
        aux[j] = aux[j].to_i
    end
    a = aux.sort
    costo = 0
    elementosMayores = []
    contadorDescendente = n-1
    for j in 0..k-1
        elementosMayores.push(a[contadorDescendente].to_i)
        contadorDescendente -= 1
        elementosMayores.push(a[contadorDescendente].to_i)
        contadorDescendente -= 1
    end
    elementosMayores = elementosMayores.sort
    longitud = elementosMayores.length-1
    if elementosMayores.include?(1)
        unos = 0
        for j in 0..longitud
            if elementosMayores[j] != 1
                break
            end
            unos = j + 1 
        end
        if unos >= ((longitud+1)/2)
            for j in 0..k-1
                elementoMenor = elementosMayores[j]
                if elementoMenor == 1
                    elementoMayor = elementosMayores[longitud]
                    longitud-=1
                else
                    elementoMayor = elementosMayores[j+1]
                end
                costo += Integer(elementoMenor/elementoMayor)
            end 
        else
            totalUnos = 0
            bandera = unos
            for j in 0..k-1
                if totalUnos != unos
                    elementoMenor = elementosMayores[totalUnos]
                    totalUnos += 1
                    elementoMayor = elementosMayores[bandera]
                    bandera +=1
                else
                    elementoMenor = elementosMayores[bandera]
                    bandera +=1
                    elementoMayor = elementosMayores[bandera]
                    bandera +=1
                end
                costo += Integer(elementoMenor/elementoMayor)
            end
        end
    else
        while longitud > 0
            elementoMenor = elementosMayores[longitud]
            longitud-=1
            elementoMayor = elementosMayores[longitud]
            longitud-=1
            costo += Integer(elementoMenor/elementoMayor)
        end 
    end
    for j in 0..contadorDescendente
        costo += a[j].to_i
    end
    resultados.push(costo)
end
puts resultados