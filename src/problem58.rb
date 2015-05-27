require "./utils.rb"

#Must be an odd number, ye?
def primes_on_diagonals_for_length(length)
	primes = 0
	the_length_before = length - 2
	for i in 1..3
		primes += 1 if is_prime( (the_length_before ** 2) + i*(the_length_before + 1))
	end
	return primes
end

primes = 0
not_primes = 0
length = 1

begin 
	length += 2
	primes_for_this_length = primes_on_diagonals_for_length length
	not_primes += 4 - primes_for_this_length
	primes += primes_for_this_length

	total = primes + not_primes

	p "length: #{length} -> primes: #{primes} -> non_primes_total = #{not_primes} -> ratio: #{primes.fdiv(total)}"

end until primes.fdiv(total) <= 0.1

p length