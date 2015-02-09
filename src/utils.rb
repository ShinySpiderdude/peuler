def get_proper_divisors(number)
	divisors = []
	for i in (1..number/2)
		divisors.push(i) if number % i == 0
	end
	return divisors
end

def is_prime(number)
	sqrt = Math.sqrt(number)
	for i in 2..sqrt
		return false if number % i == 0
	end
	return true
end

