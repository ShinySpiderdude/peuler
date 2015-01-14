
largestSeq = 0
largestNum = 0

def collatzLength(number)
	seqLength = 1

	while number != 1 do
		if (number % 2 == 0)
			number /= 2 
		else
			number = number*3 + 1
		end
		seqLength +=1
	end
	return seqLength ;
end

for i in 2..1000000
	cl = collatzLength i
	if cl > largestSeq
		largestSeq = cl
		largestNum = i
	end
end

puts "#{largestNum} -> #{largestSeq}"