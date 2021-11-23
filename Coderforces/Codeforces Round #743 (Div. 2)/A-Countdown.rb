=begin 
Entrada: testcases, entero que indica la cantidad de dígitos, 
        string de los dígitos
Salida: operaciones mínimas para que todos los dígitos sean 0
Movimientos permitidos: restar 1 a la cifra, cambiar el orden de una cifra 
(adyacente y no adyacente)
=end

# Variables
testcases = 0
numberDigits = 0
digits = ""

# Constantes
condition = true
operationReduce = false
operationChange = true

# Paso 1: Pedir los testcases
testcases = Integer(gets.chomp)
movements = Array.new(testcases)

#Paso 2: Pedir la cantidad de dígitos 
for i in (0..(testcases-1))
        numberDigits = Integer(gets.chomp)
#Paso 3: Pedir los dígitos
        digits = gets.chomp
        movements[i] = 0
        count = 0
#Paso 4: Recorrer los dígitos
        digits.chars.each do |digit|
        # Contamos las veces que iteramos
                count = count +1
                #Preguntamos si el dígito es 0
                if Integer(digit)!=0
                        #Caso no es 0
                        #Preguntamos si estamos recorriendo el último dígito
                        if count == numberDigits
                                #Caso si es
                                #Sumamos el movimiento de restas (el valor del dígito)
                                movements[i] = movements[i] + digit.to_i
                        else
                                #Caso no es
                                #Sumamos el movimiento de restas y sumamos 1 (el valor de movimientos)
                                movements[i] = movements[i] + digit.to_i + 1
                        end
                end
                
        end
end
movements.each do |elements|
        puts elements
end