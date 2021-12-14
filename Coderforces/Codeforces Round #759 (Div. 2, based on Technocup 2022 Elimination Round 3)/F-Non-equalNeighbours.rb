def nonEqualNeighbours(a,numero,posicionElementoSiguiente,cantidad,cantidadAnterior)
    if posicionElementoSiguiente == a.length
        return cantidad
    end
    numeroSiguiente = a[posicionElementoSiguiente].to_i
    vecesMayor = 0
    if numero>numeroSiguiente
        vecesMayor = numero-numeroSiguiente
        cantidad += vecesMayor * numeroSiguiente
    end
    aumento = cantidadAnterior*((numeroSiguiente - 1)*(numero-vecesMayor))
    if aumento != 1
        cantidad = cantidad + aumento
    end
    cantidad = nonEqualNeighbours(a,numeroSiguiente-1,posicionElementoSiguiente+1,cantidad,Integer(aumento/2))
    return cantidad
end
n = Integer(gets.chomp)
arreglo = gets.chomp
a = arreglo.split(" ")

total = nonEqualNeighbours(a,a[0].to_i,1,0,1)
puts total