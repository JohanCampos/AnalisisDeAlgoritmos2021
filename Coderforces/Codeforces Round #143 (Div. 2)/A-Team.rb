n = Integer(gets.chomp) 
resultado = 0
for i in (0..n-1)
    arreglo = gets.chomp
    auxiliar = arreglo.split(" ")
    if (auxiliar[0] == "1" && auxiliar[1] == "1") || (auxiliar[1] == "1" && auxiliar[2] == "1") || (auxiliar[0] == "1" && auxiliar[2] == "1")
        resultado +=1
    end
end
puts resultado