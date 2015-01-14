$lines = File.open("problem18.txt", "r").inject([]) { |lines, line| lines.push line.split(" ") }

height = $lines.length - 1

max_width = $lines[height].length - 1

def calculate(current_height, x, known_solutions = {})
	return $lines[0][0].to_i if current_height == 0 and x == 0
	#Out of boundary for the edges of the triangle
	return 0 if x == -1 or $lines[current_height][x].nil?
	return $lines[current_height][x].to_i + [calculate(current_height - 1, x), calculate(current_height - 1, x -1)].max
end


best = max_width.downto(0).inject(0) do |max, current_index| 
	value = calculate(height, current_index)
	max = value if value > max
	max
end

p best
