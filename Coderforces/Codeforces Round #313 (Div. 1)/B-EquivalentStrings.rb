string1 = gets.chomp
string2 = gets.chomp
string2prueba1 = string2.chars.sort(&:casecmp).join
string1prueba1 = string1.chars.sort(&:casecmp).join

if string1prueba1 == string2prueba1
    mitad = Integer(string1.length/2)
    mitad1String1 = string1[0,mitad]
    puts mitad1String1
    mitad1String1 = mitad1String1.chars.sort(&:casecmp).join
    mitad2String1 = string1[mitad,string1.length] 
    puts mitad2String1
    mitad2String1 = mitad2String1.chars.sort(&:casecmp).join
    mitad1String2 = string2[0,mitad]
    mitad1String2 = mitad1String2.chars.sort(&:casecmp).join
    mitad2String2 = string2[mitad,string2.length] 
    mitad2String2 = mitad2String2.chars.sort(&:casecmp).join
    if ((mitad1String1 == mitad1String2)&&(mitad2String1 == mitad2String2)) || ((mitad1String1 == mitad2String2)&&(mitad2String1 == mitad1String2))
        puts "YES"
    else 
        puts "NO"
    end
else
    puts "NO"
end