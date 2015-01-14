$numbers_to_names = {
	1 => "one",
	2 => "two",
	3 => "three",
	4 => "four",
	5 => "five",
	6 => "six",
	7 => "seven",
	8 => "eight",
	9 => "nine",
	10 => "ten",
	11 => "eleven",
	12 => "twelve",
	13 => "thirteen",
	14 => "fourteen",
	15 => "fifteen",
	16 => "sixteen",
	17 => "seventeen",
	18 => "eighteen",
	19 => "nineteen",
	20 => "twenty",
	30 => "thirty",
	40 => "forty",
	50 => "fifty",
	60 => "sixty",
	70 => "seventy",
	80 => "eighty",
	90 => "ninety"
}

#mult_100 = "hunderd"
#mult_1000 = "thousand"

def number_to_words(number)

	return "one thousand" if number == 1000

	lsb = number % 100
	msb = number / 100

	#lsb are read differently than msb
	lsb_lsb = lsb % 10
	lsb_msb = lsb / 10

	word = ""

	word = $numbers_to_names[msb] + " hundred" if msb != 0

	return word if number % 100 == 0 and msb != 0

	word += " and " if msb != 0
    
    if !$numbers_to_names[lsb].nil?
		word += $numbers_to_names[lsb] 
		return word
	end

	word += $numbers_to_names[lsb_msb * 10] + " " + $numbers_to_names[lsb_lsb]

	return word
end

def count(word)
	counts = word.split(" ").map { |x| x.length}.inject(0) { |sum, n| sum += n}
	puts "#{word} -> #{counts}"
	return counts
end

puts (1..1000).inject(0) {|sum, current| sum += count(number_to_words(current))} 

#puts number_to_words(100)