def factorial(number)
	mult = 1
	number.downto(1) { |num| mult *= num}
	return mult
end

def sum_digits(number)
	sum = 0
	number.to_s.split(//).each { |digit| sum += digit.to_i}
	return sum
end

puts sum_digits(factorial(100))