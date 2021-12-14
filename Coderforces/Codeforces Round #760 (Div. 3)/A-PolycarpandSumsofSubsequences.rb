testcases = Integer(gets.chomp)
resultados = []

for i in 0..testcases-1
    arreglo = gets.chomp
    b = arreglo.split(" ")
    numeroAConstruir = b[6].to_i
    validar = true
    finalPrincipal = false
    aumentoPrincipal = 0
    finalSecundario = false
    aumentoSecundario = 1
    finalTerceario = false
    aumentoTercerario = 2
    while validar
        if finalTerceario
            finalTerceario = false
            aumentoSecundario+=1
            if aumentoSecundario == 5
                finalSecundario = true
            end
            aumentoTercerario = aumentoSecundario + 1
        end
        if finalSecundario
            finalSecundario = false
            aumentoPrincipal += 1
            aumentoSecundario = aumentoPrincipal + 1
            aumentoTercerario = aumentoSecundario + 1
        end
            b1 = b[aumentoPrincipal].to_i
            b2 = b[aumentoSecundario].to_i
            b3 = b[aumentoTercerario].to_i
        if b1+b2+b3 == numeroAConstruir
            resultados.push(b1.to_s+" "+b2.to_s+" "+b3.to_s)
            break
        end 
        aumentoTercerario +=1
        if aumentoTercerario == 6
            finalTerceario = true
        end
    end
end
puts resultados