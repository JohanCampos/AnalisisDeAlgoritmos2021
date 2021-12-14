/Variables:/
friends = 0
total_time = []
testcases = 0

/Prerequisites: Enter de numer of testcases/
testcases = Integer(gets.chomp)

/Prerequisites: Request the number of friends to come/
for i in (0..(testcases-1))
    friends = Integer(gets.chomp)

    /Case: if the friends is less than the minimun size pizza, order the small pizza/
    if friends <= 6
        friends = 6
    end
    /Case: if the number of friends is a even number, the pizza has the minimun slides for all the friends./ 
    /But if the number of friends is a odd number, we must add a new slide on the pizza/
    if (friends%2)!=0
        friends = friends + 1
    end
    /2(3*A + B*4 + C*5) = n, 5(3*A+4*B+5*C) = costo/
    total_time[i] = (5*friends)/2
end
total_time.each do |elements|
    puts (elements)
end