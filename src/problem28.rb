#Returns the number of elements minus the first (1)
def number_of_elements_in_spiral(spiral)
	diameter = (spiral - 1) / 2
	return diameter * 4
end

def sum_of_spiral_elements(spiral)
	number_of_elements = number_of_elements_in_spiral(spiral)
	sum = 1
	current_number = 1
	#After every 4 elements, the adder is increased by 2
	for i in 1..number_of_elements
		adder = (((i-1) / 4) + 1) * 2
		current_number = current_number + adder
		#puts current_number
		sum += current_number
	end
	return sum
end

p sum_of_spiral_elements(1001)

