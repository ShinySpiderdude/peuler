def is_triangle(number)
	i = 0
	while true
		i += 1
		nth_number = 0.5*i*(i+1)
		return true if number == nth_number
		return false if number < nth_number
	end
end

def word_to_number(word)
	word.split(//).inject(0) {|result, elem| result += elem.ord - "A".ord + 1}
end

contents = File.read("problem42.txt").gsub(/"/, "").split(/,/)

number_of_triangles = 0

contents.each do |word|
	number_of_triangles +=1 if is_triangle(word_to_number(word))
end

p number_of_triangles
