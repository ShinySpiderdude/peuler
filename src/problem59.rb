$words = IO.readlines ('/usr/share/dict/american-english')
$words = $words.select! { |word| !word.include?("'")}.map {|word| word.chomp}.map {|word| word.downcase}

$secret = IO.read("problem59.txt").split(",").map {|word| word.to_i}

#An array of 3 ordinals
def xor(the_guess)
	xored = $secret.dup

	for i in 0...the_guess.length

		index = i
		while index < xored.length
			xored[index] = xored[index] ^ the_guess[i]
			index += the_guess.length
		end
	end

	return xored
end

def ordinal_to_sentence(arr)
	arr.map {|letter| letter.chr}.join("")
end


best_sentence = ""
best_sentence_good_words = 0
best_sentence_key = []


for i in 'a'.ord..'z'.ord
	for j in 'a'.ord..'z'.ord
		for k in 'a'.ord..'z'.ord

			sentence = ordinal_to_sentence(xor([i,j,k]))

			number_of_known_words = 0

			candidate_threshold = 3

			sentence_words = sentence.split(" ")

			#p sentence_words if sentence_words.length > 4 and sentence_words.include?("the")

			if sentence_words.length > 4

				sentence_words.each do |word|
					if word.length > 2 and $words.include?(word.downcase)
						number_of_known_words += 1 
						#p word
					end
				end

				if number_of_known_words > candidate_threshold and sentence_words.length > 4 and best_sentence_good_words < number_of_known_words
					best_sentence = sentence
					best_sentence_good_words = number_of_known_words
					best_sentence_key = [i, j, k]
				end
			end



			#candidate = true if sentence.split(" ").include?("the")

			# sentence.downcase.split(" ").each do |word|
			# 	word.split(//).each {|letter| candidate = false if letter.ord < 'a'.ord or letter.ord > 'z'.ord}
			# 	# if !words.include?(word) 
			# 	# 	candidate = false
			# 	# 	break
			# 	# end
			# end

			#p "#{sentence}" if candidate
		end
	end
end

# $secret = ['h'.ord, 'e'.ord, 'l'.ord, 'l'.ord, 'o'.ord].map {|word| word.to_i}

# $secret = xor(['a'.ord,'a'.ord, 'a'.ord])

# p xor(['a'.ord, 'a'.ord, 'a'.ord])

p best_sentence
#p best_sentence_key[0] + best_sentence_key[1] + best_sentence_key[2]

p best_sentence.split(//).inject(0) {|result, element| result+= element.ord}