require "set"

class Integer
	def digits
		self.to_s.size
	end

	def lsb
		"#{self.to_s[2]}#{self.to_s[3]}".to_i
	end

	def msb
		"#{self.to_s[0]}#{self.to_s[1]}".to_i
	end
end


squares = []
pentagonals = []
hexagonals = []
heptagonals = []
octagonals = []

def is_cyclic(current_number,lists,numbers_list)
	numbers_list.push(current_number)
	return true if lists.size == 0 and current_number.lsb == numbers_list[0].msb
	return false if lists.size == 0 and current_number.lsb != numbers_list[0].msb
	lists.each do |list|
		list.each do |number|
			if current_number.lsb == number.msb
				new_list = lists.dup
				new_list.delete(list)
				is_cyclic = is_cyclic(number,new_list,numbers_list)
				numbers_list.pop if !is_cyclic
				return true if is_cyclic
			end
		end
	end
	return false
end

def populate(list)
	number = 1
	i = 1
	while number.digits < 5
		i+=1
		number = yield(i)
		#p triangle
		#p triangle.digits
		list << number if number.digits == 4
	end	
end

triangles = []
populate (triangles) { |n| n*(n+1)/2 }
populate (squares) { |n| n**2 }
populate (pentagonals) { |n| n*(3*n-1)/2 }
populate (hexagonals) { |n| n*(2*n-1) }
populate (heptagonals) { |n| n*(5*n-3)/2 }
populate (octagonals) { |n| n*(3*n-2) }

# p triangles
# p squares
# p pentagonals
# p hexagonals
# p heptagonals
# p octagonals

lists = [squares, pentagonals, hexagonals, heptagonals, octagonals]

numbers_list = []

triangles.each do |number|
	result = is_cyclic(number, lists, numbers_list)
	if result
		p "#{numbers_list} -> #{numbers_list.inject {|sum, x| sum+=x}}"
		abort
	else
		numbers_list.pop
	end
end

#p numbers_list

# triangles.each do |t|
# 	squares.each do |s|
# 		pentagonals.each do |p|
# 			hexagonals.each do |hx|
# 				heptagonals.each do |hp|
# 					octagonals.each do |o|
# 						list = []
# 						list << t << s << p << hx << hp << o
# 						set = Set.new(list)
# 						next if set.size < 6
# 						p "#{t} #{s} #{p} #{hx} #{hp} #{o} -> #{list.inject {|sum, x| sum += x}}" if is_cyclic list
# 						#p list.sum if is_cyclic(list)
						
# 					end
# 				end
# 			end
# 		end
# 	end
# end

#p is_cyclic ([8128, 2882, 8281])
