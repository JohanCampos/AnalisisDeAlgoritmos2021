testcases = Integer(gets.chomp)
resultados = []

for i in 0..testcases-1
    n = Integer(gets.chomp)
    arreglo = gets.chomp
    bigram = arreglo.split(" ")
    longitudTotal = bigram.length * 2
    if longitudTotal >= n
        letrasAQuitar = longitudTotal - n
        for j in 0..bigram.length-2
            if letrasAQuitar == 0
                break
            end
            bigram1 = bigram[j]  
            bigram2 = bigram[j+1]
            if bigram1.length == 1
                if bigram1[0] == bigram2[0]
                    bigram[j+1] = bigram2[1]
                    letrasAQuitar -= 1
                end 
            else
                if bigram1[1] == bigram2[0]
                    bigram[j+1] = bigram2[1]
                    letrasAQuitar -= 1
                end 
            end
        end
    else
        letrasAAgregar = n-longitudTotal
        for j in 1..letrasAAgregar
            bigram[bigram.length-1] += "a" 
        end
    end
    string = ""
    for j in 0..bigram.length-1
        string += bigram[j]
    end
    resultados.push(string)
end
puts resultados