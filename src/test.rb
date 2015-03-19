require "./utils.rb"
require 'benchmark'

def get_number_of_prime_divisors(number)
	totals = 0
	for i in 2..number/2
		totals +=1 if number % i == 0
	end
	return totals
end

$divisors = {}

def get_prime_divisors(number)
	divisors = {}
	largest_possible_divisor = Math.sqrt(number)
    currentNumber = number
    index = 1
    while true
    	index += 1
    	break if index > currentNumber or index > largest_possible_divisor
    	if $divisors.include?(currentNumber)
    		$divisors[currentNumber].each do |k, v| 
    			divisors[k] = 0 if divisors[k].nil?
    			divisors[k] += v
    		end
    		break ;
    	end
    	if is_prime(index)
    		if currentNumber % index == 0
    			divisors[index] = 0
    			while currentNumber % index == 0
    				divisors[index] += 1
    				currentNumber /= index
    			end
    		end
    	end
    end
    return divisors ;
end

for i in 2..100000
 get_prime_divisors(i) 
end


#while i < 134043
	#p i
	#p "#{i} -> #{get_prime_divisors(i)}"
#	get_prime_divisors(i)
	#get_proper_divisors i
#	i+=1
#end