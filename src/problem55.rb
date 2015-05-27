def is_palyndrome(number)
	number_s = number.to_s
	for i in 0..number_s.size/2
		return false if number_s[i] != number_s[-1-i]
	end
	return true
end

def is_lychrel(number, iteration)
	return true if (iteration > 50)
	return false if is_palyndrome(number) and iteration != 0
	return is_lychrel(number + number.to_s.reverse.to_i, iteration + 1)
end

total_lychrels = 0

for i in 1..10000
	total_lychrels +=1 if is_lychrel i, 0
end

p total_lychrels