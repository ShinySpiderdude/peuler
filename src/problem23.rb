require "./utils"
require 'set'

def sum(numbers)
	return numbers.inject(0) {|result, element| result + element}
end

def is_abundant(number)
	return true if sum(get_proper_divisors(number)) > number
	false
end

#Find all abundant numbers up to 28123
abundants = []

for i in (1..28123)
	abundants.push(i) if is_abundant(i)
end

#All the numbers that can be expressed as a sum of abundants up to 28123
sum_of_abundants = Set.new

#now find the sum of all abundant numbers
for i in (0..abundants.length-1)
	for j in (i..abundants.length-1)
		abundant_sum = abundants[i] + abundants[j]
		#Because there's no point in looking further
		break if abundants[i] + abundants[j] > 28123
		sum_of_abundants.add(abundant_sum) #if !sum_of_abundants.include?(abundant_sum)

	end
end

#Now filter out all those numbers from the natural numbers up to 28123
all_numbers = Set.new
for i in (1..28123)
	all_numbers.add(i)
end

diff = all_numbers - sum_of_abundants

puts sum(diff.to_a)