require "./utils.rb"

def is_truncatable_prime_left(number)
	return false if !is_prime(number)
	return true if number / 10 == 0 and is_prime(number)
	return is_truncatable_prime_left(number.to_s[0..-2].to_i)
end

def is_truncatable_prime_right(number)
	return false if !is_prime(number)
	return true if number / 10 == 0 and is_prime(number)

	return is_truncatable_prime_right(number.to_s[1..-1].to_i)
end

i = 10
found = []

while found.size < 11
	value = is_truncatable_prime_left(i) && is_truncatable_prime_right(i)
	found << i if value
	i += 1
end

p found
p found.inject(0) {|result, elem| result += elem}
