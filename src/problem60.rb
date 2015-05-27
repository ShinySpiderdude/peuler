require "./utils.rb"

def concatenated_prime(number1, number2)
	return true if is_prime "#{number1}#{number2}".to_i
	return false
end

def intersect (prime_hash)
	#remove all hashes that aren't at least in the order's length
	new_hash = {}
	prime_hash.each do |k, v|
		new_hash[k] = v if v.length >= $order - 1
	end

	#remove all the values we removed from the value arrays that are left
	new_hash.each do |k, v|
		v.select! {|value| new_hash.include?(value)}
	end

	#continue until there are no changes 
	is_same = true
	prime_hash.each do |k, v|
		if new_hash[k].nil? or new_hash[k].length != v.length
			is_same = false
			break
		end
	end

	#p "#{is_same}: #{prime_hash} -> #{new_hash}"

	new_hash = intersect(new_hash) if !is_same

	return new_hash
end

$primes = []

#how many primes should have the property in a set
$order = 5

number = 1

while true
	number += 1
	if is_prime number

		#log = false
		#log = true if number == 673
		
		primed_candidates = []

		$primes.each do |prime| 
			primed_candidates << prime if concatenated_prime number, prime and concatenated_prime prime, number
		end

		primed_candidates << number

		#This prime had found at least $order prime before it that it "concatenates with"
		#now i want to see which concatenated subsets are there
		if primed_candidates.size >= $order
			#p primed_candidates
			#Check that every 2 candidates are concatenated primes

			primed_subsets = {}

			primed_candidates.each do |current|

				primed_subsets[current] = []

				for i in 0...primed_candidates.length do
					other = primed_candidates[i]

					next if current == other

					primed_subsets[current] << other if concatenated_prime current, other and concatenated_prime other, current
				end
			end

			intersected_concatenates = intersect (primed_subsets)

			#The intersected hash should have a size of $order and in each value there should be an array of size $order -1
			is_this_it = true
			intersected_concatenates.each_value {|v| is_this_it = false if v.length != $order-1 }
			is_this_it = false if intersected_concatenates.size != $order

			if is_this_it
				p intersected_concatenates
				p intersected_concatenates.keys.inject(0) {|result, elem| result += elem}
				abort
			end

			#p intersected_concatenates if intersected_concatenates.length > 0

			#p "#{number}: #{primed_candidates} -> #{primed_subsets} -> #{intersected_concatenates}"
			#p intersected_concatenates if intersected_concatenates[0].length == $order -1

		end

		$primes << number
	end
end
