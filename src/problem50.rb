$primes = []

def is_prime(number)
  #Search all know primes, if it's not one of them, search further until we reach the number
  #Note that there is an assumption here that the primes will be checked in increasing order
  $primes.each {|prime| return false if number % prime == 0 }
  $primes << number
  return true
end

def total_consecutive_primes(number)
end

best_consecutive_primes = 0
best_consecutive_i = 0

for i in 2...1000000
	if is_prime i
		total_consecutive_primes = total_consecutive_primes i
		if total_consecutive_primes > best_consecutive
			best_consecutive = total_consecutive_primes 
			best_consecutive_i = i
		end
	end
end

