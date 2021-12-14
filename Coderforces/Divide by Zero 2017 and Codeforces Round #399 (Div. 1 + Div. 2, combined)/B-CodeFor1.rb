#Entrada: n,l,r, n es el número inicial, l es la posición inicial de lectura y r es la posición final de lectura
#Salida: el arreglo final en el intervalo inicialmente dado
#Fórmula: valor leido = (valor leido)/2, valor leido mod 2, (valor leido)/2 hasta que valor leido > 1

def CodeFor1(x)
    if !(x > 1)
        return x.to_s
    end

    primerTercerValor = Integer(x/2)
    segundoValor = x%2
    
    primerTercerValorString = CodeFor1(primerTercerValor)
    segundoValorString = CodeFor1(segundoValor)

    return primerTercerValorString + " " + segundoValorString + " " + primerTercerValorString
end

#Variables
n=0
l=0
r=0

auxiliar = gets.chomp
aux = auxiliar.split(" ")

n = Integer(aux[0])
l = Integer(aux[1])-1
r = Integer(aux[2])-1

#Función solución
cadena = CodeFor1(n)
resultado = cadena.split(" ")

contador = 0
for i in (l..r)
    if resultado[i]=="1" 
        contador += 1
    end
end

puts contador