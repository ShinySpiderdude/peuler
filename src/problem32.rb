
require "set"

#Find all permutations
def permutations(from_list, to_list, all_lists)
	#p "#{from_list}, #{to_list}, #{all_lists}"
	if from_list == []
		all_lists << to_list
		return
	end
	for i in 0..from_list.size - 1
		new_from = from_list.dup
		new_to = to_list.dup

		new_to << new_from[i]
		new_from.delete_at(i)

		permutations(new_from, new_to, all_lists)
	end
end

all_lists = []
permutations([1, 2,3,4,5,6,7,8,9], [], all_lists)


pandigitals = []

all_lists.each do |pandigital_array|
	#Turn the array to an integer
	number = pandigital_array.map(&:to_s).join("").to_i
	for i in 0..3
		for j in i+1..4
			multiplicand = number / (10 ** (8-i))
			multiplier = (number % (10 ** (8-i))) / (10 ** (8-j)) 
			product = number % (10 ** (8-j))

			#The below implementation is slower, but viable
			#multiplier = number.to_s[i+1..j].to_i
			#product = number.to_s[j+1..9].to_i
			#p "#{i} #{j}"
			#p "#{multiplicand} #{multiplier} #{product}"
			if multiplicand * multiplier == product
				pandigitals << "#{multiplicand} #{multiplier} #{product}"
				#p "#{multiplicand} #{multiplier} #{product}"
			end
		end
	end
end

p pandigitals
#Get all products
products = Set.new

pandigitals.each do |pand|
	products << pand.split(" ")[2].to_i
end

sum_of_products = products.inject(0) {|result, element| result += element}

p "sum of products = #{sum_of_products}"