$lines = File.open("problem67.txt", "r").inject([]) { |lines, line| lines.push line.split(" ") }

height = $lines.length - 1

max_width = $lines[height].length - 1

$known_solutions = {}

def calculate(current_height, x)
	return $lines[0][0].to_i if current_height == 0 and x == 0
	return $known_solutions[[current_height, x]] if !$known_solutions[[current_height, x]].nil?
	#Out of boundary for the edges of the triangle
	return 0 if x == -1 or $lines[current_height][x].nil?
	solution = $lines[current_height][x].to_i + [calculate(current_height - 1, x), calculate(current_height - 1, x -1)].max
	$known_solutions[[current_height, x]] = solution
	return solution
end


best = max_width.downto(0).inject(0) do |max, current_index| 
	value = calculate(height, current_index)
	max = value if value > max
	max
end

p best
