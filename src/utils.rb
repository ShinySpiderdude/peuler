def get_proper_divisors(number)
	divisors = []
	for i in (1..number/2)
		divisors.push(i) if number % i == 0
	end
	return divisors
end

def is_prime(number)
	return false if number == 1
	sqrt = Math.sqrt(number)
	for i in 2..sqrt
		return false if number % i == 0
	end
	return true
end

def factorial(number)
	sum = 1 
	number.downto(2) {|number| sum *= number}
	return sum
end

#Generate all permutations of pandigitals of the given orders
def generate_pandigitals (order)
	(1..order).to_a.permutation.map(&:join)
end