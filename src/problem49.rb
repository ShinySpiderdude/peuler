require "./utils.rb"
require "set"

for i in 1000..9999
	if is_prime(i)
		s = Set.new(i.to_s.split(//).permutation.map(&:join))
		the_primes = []
		s.each {|item| the_primes << item if is_prime (item.to_i)}
		the_primes = the_primes.sort
		if the_primes[0][0] != "0" and the_primes.size > 2
			for i in 0..the_primes.size - 3
				for j in i+1..the_primes.size - 2
					for k in j+1..the_primes.size - 1
						if the_primes[k].to_i - the_primes[j].to_i == the_primes[j].to_i - the_primes[i].to_i
							p "#{the_primes[i]}/#{the_primes[j]}/#{the_primes[k]}"
						end
					end
				end
			end
			#p the_primes
		end
	end
end