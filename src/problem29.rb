require "set"

s = Set.new

for i in 2..100
	for j in 2..100
		s << i ** j
	end
end

p s.size