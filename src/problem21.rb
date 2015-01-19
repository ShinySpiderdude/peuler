require "./utils.rb"

def sum(numbers)
	return numbers.inject(0) {|result, element| result + element}
end


amicables = []
for i in (1..10000)
	next if amicables.include?(i)
	sum_of_divisors = sum(get_proper_divisors(i))
	if sum(get_proper_divisors(sum_of_divisors)) == i and sum_of_divisors != i
		#This is an amicable pair
		amicables.push(i)
		amicables.push(sum_of_divisors)
	end
end

puts sum(amicables)