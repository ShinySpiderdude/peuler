def number_of_digits(number)
	number.to_s.split(//).length
end

a = 1
b = 1
i = 2
while true
	c = a + b
	i = i + 1
	if number_of_digits(c) == 1000
		puts i
		break ;
	end
	a = b
	b = c
end
