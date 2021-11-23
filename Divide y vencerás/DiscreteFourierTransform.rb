# recibimos un array de n números 
# recorremos el arreglo
# en cada iteración, calculamos la base W = e^((-j*pi*2)/N), esta base la elevamos a la k*n 
# y lo multiplicamos por el número del arreglo 
# Nota: Omega = 2*pi/N --> constante; N = m; X[k] = r[k].

def DFT (x,m)
    omega = ((2*Math::PI)/m)*-1
    r = Array.new(m)
    for k in (0..m-1)
        r[k] = 0
        for n in (0..m-1)
            r[k] = r[k] + x[n] * Math::E**(Complex(0,omega*k*n))
        end
    end 

    return r
end

def leerArreglo (n)
    x = Array.new(n)
    for i in (0..n-1)
        x[i] = Integer(gets.chomp)
    end

    return x
end


puts("Ingresa el número de señales a ingresar")
n = Integer(gets.chomp)

puts("Ingresa los valores de las señales")
x = leerArreglo(n)

r = DFT(x,n)
puts "El resultado es"
puts r