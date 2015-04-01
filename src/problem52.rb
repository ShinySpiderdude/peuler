power = 3
while true
	power += 1
	for i in 10**power..(2*10**power - 1)
		digits = i.to_s.split(//).sort
		same = true
		for j in 2..6
			if (i*j).to_s.split(//).sort != digits
				same = false
				break
			end
		end
		if same
			p i
			abort
		end
	end
end