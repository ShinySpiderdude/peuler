def next_power_of_10(number)
	pow = 1
	pow = pow * 10 while (pow / number < 1)
	return pow
end

starting_point = next_power_of_10(177)

#In case i ever forget, this is basically based on long divison for fractions
def find_cycle(divider)
	cycles = {}
	substractor = 0
	number = next_power_of_10(divider)
	result = []
	while true
		substractor = (number / divider) * divider
		result << number/divider
		#p result
		#puts "substractor: #{substractor}"
		number = (number - substractor) * 10
		#puts "after substraction * 10: #{number}"
		return 0 if number == 0

		cycles.each_key { |k| cycles[k] = cycles[k] + 1}
		break if cycles.include?(number)
		cycles[number] = 0
	end
	#puts "cycles = #{cycles[number]}"
	return cycles[number]
end

#find_cycle(2)

max_cycle = 0
max_cycle_number = 0
for i in (2..1000)
	cycle = find_cycle(i)
	#puts "number: #{i} -> cycle: #{cycle}"
	if (cycle > max_cycle)
		max_cycle = cycle
		max_cycle_number = i
	end
end

puts "The largest cycle is #{max_cycle} for number --> #{max_cycle_number} <-- (#{1.0/max_cycle_number})"
