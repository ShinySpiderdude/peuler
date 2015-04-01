def choose(r, n)
	r = n - r if r > n/2
	
	top = 1
	for i in 0..r-1
		top *= (n-i)
	end

	bot = 1
	for i in 1..r
		bot *= i
	end

	return top / bot
end

total = 0

for n in 1..100
	for r in 1..n
		total+=1 if choose(r, n) > 1000000
	end
end

p total