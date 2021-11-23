# Página 932
def recursiveFFT(x,n)
    if n == 1
        return x
    end
    wn = Math::E**(Complex(0,2*Math::PI/n))
    w = 1
    a0, a1 = dividirArregloALaMitad(x,n)
    y0 = recursiveFFT(a0,n/2)
    y1 = recursiveFFT(a1,n/2)
    y = Array.new(n)
    for k in (0..(n/2)-1)
        y[k] = y0[k] + w*y1[k]
        if y[k].class == Integer
            y[k] = Complex(y[k],0)
        end
        y[k+n/2] = y0[k] - w*y1[k]
        w = w*wn
    end
    return y
end

def dividirArregloALaMitad(arreglo,longitud)
    primeraMitad = Array.new(longitud/2)
    segundaMitad = Array.new(longitud/2)
    contador = 0
    for i in (0..longitud-1)
        if i%2 == 0
            primeraMitad[contador] = arreglo[i]
        else
            segundaMitad[contador] = arreglo[i]
            contador = contador+1
        end
    end
    return primeraMitad,segundaMitad
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

y = recursiveFFT(x,n)
puts "El resultado es"
puts y