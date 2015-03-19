def triangle(n)
	return n*(n+1)/2
end

def pentagonal(n)
	return n*(3*n-1)/2
end

def hexagonal(n)
	return n*(2*n-1)
end

t = 1
p = 1
h = 1

while true
	current_t = triangle(t)
	current_p = pentagonal(p)
	current_h = hexagonal(h)

	p "#{current_t} - #{t}/#{p}/#{h}" if current_t == current_h and current_h == current_p

	t+=1 if current_t <= current_h and current_t <= current_p
	p+=1 if current_p <= current_t and current_p <= current_h
	h+=1 if current_h <= current_t and current_h <= current_p
end