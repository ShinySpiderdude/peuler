#!/usr/bin/env ruby

require 'open-uri'

hands = open ("https://projecteuler.net/project/resources/p054_poker.txt") { |io| io.read}

hands.split("\n").each do |hand| 
	puts "i #{hand}"
end