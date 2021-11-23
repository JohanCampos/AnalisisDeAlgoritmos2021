
def multiplicacionMatricesAB (a,b,n)
    c = Array.new(n){Array.new(n)}
    for i in (0..n-1)
        for j in (0..n-1)
            c[i][j] = 0
            for k in(0..n-1)
                c[i][j] = c[i][j] + a[i][k]*b[k][j]
            end
        end
    end
    return c
end

def leerMatriz (n)
    matriz = Array.new(n){Array.new(n)}
    for i in (0..n-1)
        for j in (0..n-1)
            matriz[i][j] = 0
            matriz[i][j] = matriz[i][j] + Integer(gets.chomp)
        end
    end
    return matriz
end

puts "Ingrese n"
n = Integer(gets.chomp)

puts "Ingrese datos matriz A"
a = leerMatriz(n)

puts "Ingrese datos matriz B"
b = leerMatriz(n)

c = multiplicacionMatricesAB(a,b,n)

puts "Matriz c"
puts c

