def is_pandigital_slow(number)
	number.to_s.split(//).sort.map(&:to_i).each_with_index do |digit, index|
		return false if digit != index + 1
	end
	return true
end

def is_pandigital_9(candidate)
	number = candidate
	#1+2+3+4+5+6+7+8+9
	sum = 45
	while number > 0
		sum -= number % 10
		number /= 10
		#p "#{sum} #{number}"
	end
	return true if sum == 0 && is_pandigital_slow(candidate)
	return false
end

max_pandigital_product = -1

for i in 2...10000
	j = 0
	number = ""
	while number.size < 9
		j += 1
		number = "#{number}#{i*j}"
	end
	max_pandigital_product = number.to_i if number.size == 9 and number.to_i > max_pandigital_product and is_pandigital_9(number.to_i)
end


p max_pandigital_product