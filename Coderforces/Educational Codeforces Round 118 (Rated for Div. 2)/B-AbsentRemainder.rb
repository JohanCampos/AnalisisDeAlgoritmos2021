#variables
testcases = 0
n = 0
a = []
resultados = []

testcases = Integer(gets.chomp)

for i in (0..testcases-1)
    n = Integer(gets.chomp)
    auxiliar = gets.chomp
    a = auxiliar.split(" ")
    aux = []
    a.each do|c|
        aux.push(c.to_i)
    end
    a = aux.sort
    recorrido = Integer(n/2)
    avance = 1
    while recorrido != 0
        if !a.include?(a[n-1].to_i % a[n-1-avance].to_i) && a[n-1].to_i != a[n-1-avance].to_i
            resultados.push(a[n-1].to_s+" "+a[n-1-avance].to_s)
            recorrido -= 1
        end
        avance += 1
        if avance == n
            avance = 1
            n -= 1
        end
    end
end

puts resultados