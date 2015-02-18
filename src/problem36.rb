def is_palindrome(number)
	for i in 0..(number.size/2)
		return false if number[i] != number[number.size - i -1]
	end
	return true ;
end

double_palindromes = []

for i in 1...1000000
	double_palindromes << i if is_palindrome(i.to_s) and is_palindrome("%b" % i)
end

p double_palindromes
p double_palindromes.inject(0) {|result, elem| result += elem}
