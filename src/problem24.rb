#here's my basic idea
#if we have 10 digits, then i need to see when i pass 1M for all permutations. for instance ->
#I choose 0 as my first number, there are 9! = 362880 possible permutations, that's too low. i take "1", now i tried 9!*2 = 725760 permutations.. still too low,
#Now i take "2" -> now i tried 9!*3 = 1088640 permutations.. This is too high.. so "2" is the first number and i take it out of the pool of possible digits
#Now i need to hit 1M - 725760 = 274240 trying out my pool, i use 0 as the 2nd number and there are 8! = 40320 possible permutations, too low, i try the next.. etc. etc. until i hit "0"

def factorial(number)
	number.downto(2).inject(1) {|sum, element| sum *= element}
end

arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

current_target = 1000000

#arr = [0, 1, 2]
#current_target = 3

target_array = []

while true
	chosen_index = -1
	#p "array_length #{arr.length} -> #{arr}"
	for i in (1..arr.length)

		multiplier = (factorial (arr.length - 1)) * i
		#puts "multiplier for #{arr[i-1]} = #{multiplier}"
		if multiplier >= current_target
			#The new target
			last_multiplier = (factorial (arr.length - 1)) * (i-1)
			current_target = current_target - last_multiplier
			target_array.push(arr[i-1])
			arr.delete_at(i-1)
			#puts "new_target: #{current_target}"
			#p "target_array: #{target_array}"
			break ;
		end
	end
	break if current_target == 1
end

#Add what's left
target_array.push(arr)
puts target_array.flatten.join("")


