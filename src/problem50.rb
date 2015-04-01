$primes = []

def is_prime(number)
  #Search all know primes, if it's not one of them, search further until we reach the number
  #Note that there is an assumption here that the primes will be checked in increasing order
  $primes.each {|prime| return false if number % prime == 0 }
  $primes << number
  return true
end

#The idea here is to add the next prime if the number is still to small and to remove the lowest prime when the number is too large
#If i've reached the number itself and removed enuf from the left for it to be too small then the number is not a sum of consecutive primes
#It appears that there is a faster way to do this, but this one runs pretty fast also (around 7mins)
def total_consecutive_primes(number)
	return -1 if !is_prime(number)
	left = 0
	right = 0
	sum = $primes[0]
	while true
		break if right == $primes.size - 1 and sum < number
		if sum < number
			right+=1
			sum += $primes[right]
		end
		if sum > number
			sum -= $primes[left]
			left += 1
		end
		break if right == $primes.size and sum < number
		break if sum == number
	end
	return right - left + 1 if sum == number
	return -1
end

#for #i in 2..41
	#p "#{i} -> #{total_consecutive_primes i}"
#end

best_consecutive_primes = 0
best_consecutive_i = 0

for i in 2...1000000
	total_consecutive_primes = total_consecutive_primes i
	if total_consecutive_primes > best_consecutive_primes
		best_consecutive_primes = total_consecutive_primes 
		best_consecutive_i = i
		p "#{best_consecutive_i} -> #{best_consecutive_primes}"
	end
end

p "#{best_consecutive_i} -> #{best_consecutive_primes}"

