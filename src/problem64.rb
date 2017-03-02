#!/usr/bin/env ruby

def nearestWholeRoot(n)
	Math.sqrt n.downto(1).find {|n| Math.sqrt(n) % 1 == 0}
end

puts nearestWholeRoot(27)