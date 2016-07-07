#!/usr/bin/env ruby

def digit_sum (number)
	digit_sum = 0
	while number > 0
		digit_sum = digit_sum + number % 10
		number = number / 10
	end
	digit_sum
end

max_digit_sum = -1

for a in (2..99)
	for b in (2..99)
		digit_sum = digit_sum (a ** b)
		max_digit_sum = digit_sum if max_digit_sum < digit_sum
	end
end

puts max_digit_sum
