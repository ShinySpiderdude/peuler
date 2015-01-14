def brute_force_tracker(row, column)
	return 1 if row == 0 or column == 0
	return tracker(row - 1, column) + tracker(row, column-1)
end

#The idea here is that a solution for (x,y) is the same as the solution for (y,x), so there's no need to find it again
def mirror_tracker(row, column, available_solutions)
	return available_solutions["#{row}:#{column}"] if not available_solutions["#{row}:#{column}"].nil?
	return 1 if row == 0 or column == 0
	partial_solution = mirror_tracker(row - 1, column, available_solutions) + mirror_tracker(row, column-1, available_solutions)
	available_solutions["#{row}:#{column}"] = partial_solution 
	return partial_solution
end

puts mirror_tracker(20,20, {})