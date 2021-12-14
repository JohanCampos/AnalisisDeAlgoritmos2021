testcases = Integer(gets.chomp)
resultados = []

for i in 0..testcases-1
    n = Integer(gets.chomp)
    n -= 1 
    arreglo = gets.chomp
    a = arreglo.split(" ")
    aux = a.sort
    mayor = aux[n].to_i
    k = a[n].to_i
    n -= 1
    divisiones = 0
    while n != -1
        if a[n] == mayor
            n = -1
        elsif !(a[n].to_i <= k)
            k = a[n].to_i
            divisiones += 1
        end
        n-=1
    end
    resultados.push(divisiones)
end
puts resultados
