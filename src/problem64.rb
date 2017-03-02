#!/usr/bin/env ruby

def nearestWholeRoot(n)
	Math.sqrt n.downto(1).find {|n| Math.sqrt(n) % 1 == 0}
end

def next(free, nom, n, denom)
	result = {}
	result['nom'] = n - (denom ** 2)
	result['denom'] = result['nom'] - denom
	result['free'] = 

puts nearestWholeRoot(27)