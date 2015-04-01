require "./utils.rb"

def prime_family(number)
	primes = []
	for i in 0..9
		fixed = number.to_s.gsub(/1/, i.to_s).to_i
		primes << fixed if is_prime(fixed)
	end
	return primes
end

current_number = 2
while true
	current_number += 1
	if current_number.to_s.include?("1")
		prime_family = prime_family(current_number)
		if prime_family.size == 8
			#make sure they are all of the same length
			length = prime_family[0].to_s.size
			same_length = true
			prime_family.each {|number| same_length = false if number.to_s.size != length}
			next unless same_length
			p "#{current_number} -> #{prime_family}"
			break
		end
	end
end

#$p prime_family(13)