#!/usr/bin/env ruby

sol = 1

for i in 1..7830457
	sol = (sol * 2) % (10 ** 10)
end
sol = (sol * 28433) % (10 ** 10)
sol = sol + 1 
puts sol