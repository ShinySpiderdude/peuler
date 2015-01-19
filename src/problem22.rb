names = IO.read("problem22.txt").gsub!(/\"/, "").split(",").sort

def sum_of_letters(str)
	return str.split(//).inject(0) {|result, letter| result + letter.ord - "A".ord + 1 }
end

sum = 0

for i in 0..names.length-1
	sum += sum_of_letters(names[i] * (i+1))
end

puts sum