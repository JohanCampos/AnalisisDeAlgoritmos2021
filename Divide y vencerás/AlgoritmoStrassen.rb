def strassen (a,b,n)
    # Nota: matriz a y matriz b del mismo tamaño
    # Preguntamos si la matriz es de 2x2
    if n == 2
        # Caso Si
        s1 = b[0][1] - b[1][1]
        s2 = a[0][0] + a[0][1]
        s3 = a[1][0] + a[1][1]
        s4 = b[1][0] - b[0][0]
        s5 = a[0][0] + a[1][1]
        s6 = b[0][0] + b[1][1]
        s7 = a[0][1] - a[1][1]
        s8 = b[1][0] + b[1][1]
        s9 = a[0][0] - a[1][0]
        s10 = b[0][0] + b[0][1]

        p1 = a[0][0] * s1 
        p2 = s2 * b[1][1]
        p3 = s3 * b[0][0]
        p4 = a[1][1] * s4
        p5 = s5 * s6
        p6 = s7 * s8
        p7 = s9 * s10

        # Elementos de la solución
        c11 = p5 + p4 - p2 + p6
        c12 = p1 + p2
        c21 = p3 + p4
        c22 = p1 + p5 - p3 - p7
        
        c = fusion(c11,c12,c21,c22)
        return c
    else
        # Caso No
        # Dividimos cada matriz a la mitad, esas submatrices serán nuestras A11,A12,A21,A22,B11,B12...,
        # el cual llamaremos respectivamente a1, b1, c1, d1...
        # Matriz A
        a1,b1,c1,d1 = dividirEnSubmatrices(a,n)
        # Matriz B
        e1,f1,g1,h1 = dividirEnSubmatrices(b,n)

        p1 = strassen(a1, (f1-h1), n/2)
        p2 = strassen((a1+b1), h1, n/2)
        p3 = strassen((c1 + d1), e1, n/2)
        p4 = strassen(d1, (g1 - e1), n/2)
        p5 = strassen((a1 + d1), (e1 + h1), n/2)
        p6 = strassen((b1 - d1), (g1 + h1), n/2)
        p7 = strassen((a1 - c1), (e1 + f1), n/2)

        # Elementos de la solución
        c11 = p5 + p4 - p2 + p6
        c12 = p1 + p2
        c21 = p3 + p4
        c22 = p1 + p5 - p3 - p7
        
        c = fusion(c11,c12,c21,c22)
        return c
    end
end

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

def fusion (c11,c12,c21,c22)
    c = Array.new(2){Array.new(2)}
    c[0][0] = c11
    c[0][1] = c12
    c[1][0] = c21
    c[1][1] = c22
    return c
end

def dividirEnSubmatrices (matriz,n)
    a = Array.new(n/2){Array.new(n/2)}
    b = Array.new(n/2){Array.new(n/2)}
    c = Array.new(n/2){Array.new(n/2)}
    d = Array.new(n/2){Array.new(n/2)}
    # Recorremos cuadrante 1
    for i in(0..((n/2)-1))
        for j in(0..((n/2)-1))
            a[i][j] = 0
            a[i][j] = matriz[i][j]
        end
    end
    # Recorremos cuadrante 2
    fila = 0
    columna = 0
    for i in((n/2)..(n-1))
        columna = 0
        for j in(0..((n/2)-1))
            b[fila][columna] = 0
            b[fila][columna] = matriz[i][j]
            columna = columna + 1
        end
        fila = fila + 1
    end
    # Recorremos cuadrante 3
    fila = 0
    columna = 0
    for i in(0..((n/2)-1))
        columna = 0
        for j in((n/2)..(n-1))
            c[fila][columna] = 0
            c[fila][columna] = matriz[i][j]
            columna = columna + 1
        end
        fila = fila + 1
    end
    # Recorremos cuadrante 4
    fila = 0
    columna = 0
    for i in((n/2)..(n-1))
        columna = 0
        for j in((n/2)..(n-1))
            d[fila][columna] = 0
            d[fila][columna] = matriz[i][j]
            columna = columna + 1
        end
        fila = fila + 1
    end
    return a,b,c,d
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

c = strassen(a,b,n)

puts "Matriz c"
puts c