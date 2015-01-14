def sum_digits(number)
	sum = 0
	number.to_s.split(//).each { |digit| sum += digit.to_i}
	return sum
end

puts sum_digits(2**1000)