$coins = [1, 2, 5, 10, 20, 50, 100, 200]
#$coins = [1, 2]

$total = 0

def calc(usable, sum)
	if sum == 0
		$total += 1
		return
	end
	return if sum < 0
	usable.each_with_index do |coin, index|
		cloned = usable.clone
		index.times { cloned.shift }
		calc(cloned, sum - coin)
	end
end

calc($coins, 200)

puts $total
