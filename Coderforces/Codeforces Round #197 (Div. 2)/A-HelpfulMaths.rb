arreglo = gets.chomp
numeros = arreglo.split("+")
numerosOrdenados = numeros.sort
resultado = ""
for i in (0..numerosOrdenados.length-1)
    resultado += numerosOrdenados[i]
    if i!=numerosOrdenados.length-1
        resultado += "+"
    end
end
puts resultado