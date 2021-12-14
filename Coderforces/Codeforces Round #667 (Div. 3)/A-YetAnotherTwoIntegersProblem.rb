testcases = Integer(gets.chomp)
resultados = []

for i in (0..testcases-1)
    arreglo = gets.chomp
    aux = arreglo.split(" ")
    auxiliar = aux.sort
    a = auxiliar[0]
    b = auxiliar[1]
    movimientos = 0
    aumentoCifra = 1
    cantidad = b.to_i-a.to_i
    
    if cantidad < 0
        cantidad = cantidad * -1
    end
    cantidadString = cantidad.to_s
    longitud = cantidadString.length-1
    if cantidadString[longitud].to_i != 0
        movimientos += 1
    end
    longitud = longitud - 1
    while longitud != -1
        movimientos += (cantidadString[longitud].to_i * aumentoCifra)
        aumentoCifra = aumentoCifra * 10 
        longitud = longitud - 1
    end
    resultados.push(movimientos)
end

puts resultados