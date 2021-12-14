def dividirArreglo(a,n)
    posicionesImpares = []
    posicionesPares = []
    
    for j in 0..n-1
        if j%2 == 0
            posicionesPares.push(a[j].to_i)
        else
            posicionesImpares.push(a[j].to_i)
        end
    end
    return posicionesImpares, posicionesPares
end

def verificarDivisiones(a,n,elemento)
    for i in 0..n-1
        if !(a[i]%elemento == 0)
            return false
        end
    end
    return true
end

def verificarNingunaDivision(a,n,elemento)
    for i in 0..n-1
        if (a[i]%elemento == 0)
            return false
        end
    end
    return true
end
testcases = Integer(gets.chomp)
resultados = []

for i in 0..testcases-1
    n = Integer(gets.chomp)
    arreglo = gets.chomp
    a = arreglo.split(" ")
    if n == 2
        aSort = a.sort
        if aSort[0]!=aSort[1]
            resultados.push(aSort[1])
        else
            resultados.push(0)
        end
    else
        parte1, parte2 = dividirArreglo(a,n)
        partesSort = parte1.sort
        minimoParte1 = partesSort[0]
        partesSort = parte2.sort
        minimoParte2 = partesSort[0]
        validarParte1 = verificarDivisiones(parte1,parte1.length,minimoParte1)
        if validarParte1
            validarParte2Con1 = verificarNingunaDivision(parte2,parte2.length,minimoParte1)
            if validarParte2Con1
                resultados.push(minimoParte1)
            else
                validarParte2 = verificarDivisiones(parte2,parte2.length,minimoParte2)
                if validarParte2
                    validarParte1Con2 = verificarNingunaDivision(parte1,parte1.length,minimoParte2)
                    if validarParte1Con2
                        resultados.push(minimoParte2)
                    else
                        resultados.push(0)
                    end
                else
                    resultados.push(0)
                end
            end
        else
            validarParte2 = verificarDivisiones(parte2,parte2.length,minimoParte2)
            if validarParte2
                validarParte1Con2 = verificarNingunaDivision(parte1,parte1.length,minimoParte2)
                if validarParte1Con2
                    resultados.push(minimoParte2)
                else
                    resultados.push(0)
                end
            else
                resultados.push(0)
            end
        end
    end
end
puts resultados