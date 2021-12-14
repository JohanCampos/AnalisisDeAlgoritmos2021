n = Integer(gets.chomp)
arreglo = gets.chomp

t = arreglo.split(" ")
unos = []
dos = []
tres = []
for i in (0..n-1)
    if t[i] == "1"
        unos.push(i+1)
    elsif t[i] == "2"
        dos.push(i+1)
    elsif t[i] == "3"
        tres.push(i+1)
    end
end

w = 0

if unos.length < dos.length
    if tres.length < unos.length
        w = tres.length
    else
        w = unos.length
    end
else 
    if tres.length < dos.length
        w = tres.length
    else
        w = dos.length
    end
end

puts w

contador = 0
while w != 0
    puts unos[contador].to_s+" "+dos[contador].to_s+" "+tres[contador].to_s
    w-=1
    contador+=1
end
