require "./utils.rb"
require "set"

def rotate(number)
	arr = number.to_s.split(//)
	arr.push(arr.shift)
	return arr.join.to_i
end

def circular_primes(number)
	return [] if !is_prime(number) || number.to_s.split(//).include?("0")
	arr = []
	arr << number
	rotated = rotate(number)
	while (rotated != number)
		return [] if !is_prime(rotated)
		arr << rotated
		rotated = rotate(rotated)
	end
	return arr
end

set = Set.new

for i in 2...1000000
	circular_primes(i).each { |v| set << v}
end
p set.size

p set


