def sum_of_power(number, power)
	#Number to list
	number.to_s.split(//).map(&:to_i).map { |elem| elem ** power }.inject(0) {|res, elem| res += elem}
end

sum = 0

#puts sum_of_power(100, 4)

number = 10
while true
	sum_of_power = sum_of_power(number, 5)
	if number == sum_of_power
		sum += number
		puts number
	end

	#I couldn't come up with the "Good" stop condition, but generally speaking, eventually the "number" will be too big for the sum_of_powers
	#One way to test is so: if "number" is of the form 99999... then if the sum of powers for this number is lower than the number then it can't exceed further
	#and we can stop
	if number.to_s =~ /^9+$/
		break if sum_of_power < number
	end
	number += 1
end

puts "sum = #{sum}"
