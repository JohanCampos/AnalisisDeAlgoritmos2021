testcases = Integer(gets.chomp)
resultados = []

for i in (0..testcases-1)
    n = Integer(gets.chomp)
    arreglo = gets.chomp
    aux = arreglo.split(" ")
    a = aux.sort
    validar = true
    for x in (0..n-2)
        if !((a[x+1].to_i-a[x].to_i) <= 1)
            validar = false
            break
        end
    end
    if validar 
        resultados.push("YES")
    else
        resultados.push("NO")       
    end
end

puts resultados