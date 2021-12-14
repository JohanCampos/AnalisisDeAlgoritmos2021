n = Integer(gets.chomp)

auxiliar = gets.chomp
x = auxiliar.split(" ")
auxiliar = gets.chomp
y = auxiliar.split(" ")
validar = true
for i in (1..n)
    if !(x.include?(i.to_s)) && !(y.include?(i.to_s))
        validar = false
        break
    end
end

if validar
    puts "I become the guy."
else
    puts "Oh, my keyboard!"
end