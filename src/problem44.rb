def P(n)
	return n*(3*n-1)/2
end

$known_pentagonals = [1]

def is_pentagonal(number)
	if number <= $known_pentagonals[-1]
		if $known_pentagonals.include?(number)
			return true
		else 
			return false
		end
	end
	n = $known_pentagonals.size + 1
	pentagonal = P(n)
	$known_pentagonals << pentagonal
	while pentagonal < number
		n+=1
		pentagonal = P(n)
		$known_pentagonals << pentagonal
	end
	return true if pentagonal == number
	return false
end

def minimal_D_for_n(n)
	pn = P(n)
	for i in (n-1).downto(1)
		pi = P(i)
		#p "#{pn} - #{pi} = #{pn-pi}: #{is_pentagonal(pn-pi)} - #{is_pentagonal(pn+pi)}"
		if is_pentagonal(pn - pi) and is_pentagonal(pn+pi)
			p "#{pn} - #{pi}" 
			return pn - pi 
		end
	end
	return 99999999999999999999999999999
end

#p minimal_D_for_n(3)

minimal_D = 9999999999999999999999999999
i = 2
while true
	minimal_D_for_i = minimal_D_for_n(i)
	if minimal_D_for_i < minimal_D
		minimal_D = minimal_D_for_i
		p "#{i} -> #{minimal_D}"
		break minimal_D_for_i == P(i) - P(i-1)
	end
	i+=1
end

p minimal_D

