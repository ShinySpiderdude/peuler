require "./utils.rb"

def consecutive_primes(a, b)
	consecutive_primes = 0
	i = 0
	while true
		the_number = i ** 2 + a*i + b
		break if the_number < 2
		if is_prime(the_number)
			consecutive_primes += 1 
			i += 1
		else
			break
		end
	end
	return consecutive_primes
end

max_consecutive_primes = 0
max_a = 0
max_b = 0

for a in -1000..1000
	for b in -1000..1000
		consecutive_primes = consecutive_primes(a, b)
		#p "#{a}:#{b}->#{consecutive_primes}"
		if consecutive_primes > max_consecutive_primes
			max_consecutive_primes = consecutive_primes
			max_a = a
			max_b = b
		end
	end
end

p "max consecutive primes are: #{max_consecutive_primes} for a=#{max_a} and b=#{max_b}. a * b = #{max_a*max_b}"