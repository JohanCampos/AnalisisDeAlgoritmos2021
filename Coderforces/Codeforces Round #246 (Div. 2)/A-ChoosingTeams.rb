def choosingTeams (y,inicio,final,bandera)
    if !(y[inicio].to_i < bandera)
       return 0
    end
    while final != inicio-1
        if y[final].to_i < bandera
            return final
        end
        final -= 1
    end
    return 0
end

arreglo = gets.chomp

aux = arreglo.split(" ")
n = aux[0].to_i
k = aux[1].to_i

arreglo = gets.chomp

aux = arreglo.split(" ")
y = aux.sort
bandera = 6-k

longitud = n-1
mitad = Integer(longitud/2)
parte1 = 0
parte2 = 0
parte1 = choosingTeams(y,0,mitad,bandera)
if parte1 == mitad
    parte2 = choosingTeams(y,mitad+1,longitud,bandera)
end

if parte2 != 0
    parte2 = Integer((parte2+1)/3)
    puts parte2
else 
    parte1 = Integer((parte1+1)/3)
    puts parte1
end
