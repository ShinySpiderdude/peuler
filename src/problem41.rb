require "./utils.rb"

the_largest_prime = 0

9.downto(2) do |i|
	arr = generate_pandigitals(i).sort.reverse

	arr.each do |number|
		the_largest_prime = number.to_i if is_prime(number.to_i)
		break if the_largest_prime > 0
	end
end

p the_largest_prime