#Entrada: testcases, 2 números, uno indica el entero, y el segundo indica la cantidad de 0
# se recibe 2 pares de números por cada testcase para comparar
#Salida: ">" si el primer número es mayor al segundo, "=" si ambos números son iguales
# "<" si el primer número es menor al segundo 

#variables
testcases = 0
numero1 = 0
numero2 = 0
resultados = []

#recibimos testcases
testcases = Integer(gets.chomp)
for i in(0..testcases-1)
    # recibimos el primer par de número
    auxiliar = gets.chomp
    aux = auxiliar.split(" ")
    # Separamos el par 
    numero1 = Integer(aux[0])
    cantidadDe0DeNumero1 = Integer(aux[1])
    # recibimos el segundo par de números y obtenemos el segundo número de comparación
    auxiliar = gets.chomp
    aux = auxiliar.split(" ")
    # Separamos el par 
    numero2 = Integer(aux[0])
    cantidadDe0DeNumero2 = Integer(aux[1])
    # Quitamos 0 innecesarios y obtenemos el numero total descrito
    if cantidadDe0DeNumero1 != 0 && cantidadDe0DeNumero2 != 0
        if cantidadDe0DeNumero1 > cantidadDe0DeNumero2 
            cantidadDe0DeNumero1 = cantidadDe0DeNumero1 - cantidadDe0DeNumero2
            cantidadDe0DeNumero2 = 0
        elsif cantidadDe0DeNumero1 < cantidadDe0DeNumero2
            cantidadDe0DeNumero2 = cantidadDe0DeNumero2 - cantidadDe0DeNumero1
            cantidadDe0DeNumero1 = 0
        else
            cantidadDe0DeNumero1 = 0
            cantidadDe0DeNumero2 = 0
        end
    end
    numero1 = numero1 * (10**cantidadDe0DeNumero1)
    numero2 = numero2 * (10**cantidadDe0DeNumero2)
    # Procedemos a comparar y guardar el resultado en el arreglo
    if numero1 < numero2
        resultados.push("<")
    elsif numero1 > numero2
        resultados.push(">")
    else
        resultados.push("=")
    end
end

puts(resultados)