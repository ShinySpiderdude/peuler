def generate_pandigitals
	(0..9).to_a.permutation.map(&:join)
end

valid_results = []

generate_pandigitals.each do |number|
	number_s = number.to_s
	valid_results << number if number_s[1..3].to_i % 2 == 0 &&
		number_s[2..4].to_i % 3 == 0 &&
		number_s[3..5].to_i % 5 == 0 &&
		number_s[4..6].to_i % 7 == 0 &&
		number_s[5..7].to_i % 11 == 0 &&
		number_s[6..8].to_i % 13 == 0 &&
		number_s[7..9].to_i % 17 == 0
end


sum = valid_results.inject(0) { |result, elem| result += elem.to_i }
p sum