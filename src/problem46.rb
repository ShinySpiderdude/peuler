require "./utils.rb"

def find_next_prime(prime)
	tested = prime+1
	while true
		return tested if is_prime(tested)
		tested +=1
	end
end

def is_compositable(number)
	return true if number % 2 == 0 or is_prime(number)
	for i in 2..number-2
		the_squared = 1
		next if !is_prime(i)
		#p i
		while number > i + 2* the_squared ** 2
			the_squared +=1 
			#p "#{i} + 2 * #{the_squared}**2"
		end
		if number == i + 2 * the_squared ** 2
			p "#{number}=#{i} + #{2*the_squared**2}"
			return true
		end
	end
	return false
end

i = 7
while true
	i+=2
	break if !is_compositable i
end

p i


# while true
# 	odd_composite += 2
# 	next if is_prime(odd_composite)
# 	found = false
# 	for i in 2..odd_composite-2
# 		the_squared = 1
# 		if is_prime(i)
# 			the_squared += 1 while odd_composite < i + 2*(the_squared**2)
# 			if odd_composite == i + 2*(the_squared**2)
# 				found = true
# 				p "#{odd_composite} = #{i} + #{2*the_squared**2}"
# 				break ;
# 			end
# 		end
# 	end
# 	if !found
# 		p "#{odd_composite}"
# 		break
# 	end
# end
