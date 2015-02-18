require "./utils"



def sum_of_factorials(number)
	return number.to_s.split(//).inject(0) {|result, elem| result += factorial(elem.to_i) }
end


curiosities = []

i = 3
while true
	sum_of_factorials = sum_of_factorials(i)
	curiosities << i if i == sum_of_factorials
	#p sum_of_factorials if i == sum_of_factorials
	i += 1

	#I didn't think much about the stop condition, but brute force just gives me 2 numbers
	break if i == 100000
	
end

p curiosities