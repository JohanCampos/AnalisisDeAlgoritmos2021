testcases = Integer(gets.chomp)
resultados = []

for i in 0..testcases-1
    n = Integer(gets.chomp)
    arreglo = gets.chomp
    a = arreglo.split(" ")
    advertencia = 0
    aumentoCrecimiento = false
    crecimiento = 1
    for j in 0..n-1
        if a[j] == "1"
            advertencia = 0 
            if aumentoCrecimiento 
                crecimiento += 5
            else
                crecimiento += 1
                aumentoCrecimiento = true
            end
        else
            aumentoCrecimiento = false
            advertencia += 1
        end
        if advertencia == 2
            crecimiento = -1
            break
        end
    end
    resultados.push(crecimiento)
end

puts resultados