n = Integer(gets.chomp)
resultado = 0
while n != 0
    if n >= 100
        n = n - 100
        resultado += 1
    elsif n >= 20
        n = n - 20
        resultado += 1
    elsif n >= 10
        n = n - 10
        resultado += 1
    elsif n >= 5
        n = n - 5
        resultado += 1
    else
        n = n - 1
        resultado += 1
    end
end
puts resultado