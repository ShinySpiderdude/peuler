#Let's find all possible solutions for p <= 1000

solutions = {}

for a in 1..998
	for b in a..1000
		c = a**2 + b**2
		c = Math.sqrt(c)
		next if c != c.to_i
		#p "#{a}, #{b}, #{c}"

		p = a+b+c.to_i
		next if p > 1000
		solutions[p] = 0 if solutions[p].nil?
		solutions[p] += 1
	end
end


best_key = -1
best_value = -1

solutions.each do |k, v| 
	if v > best_value
		best_key = k
		best_value = v
	end
end

p "#{best_key} -> #{best_value}"
