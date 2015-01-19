def get_proper_divisors(number)
	divisors = []
	for i in (1..number/2)
		divisors.push(i) if number % i == 0
	end
	return divisors
end
