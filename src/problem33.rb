require "./utils.rb"

def is_non_trivial(nominator, denominator)
	return false if nominator == denominator
	nom_digits = nominator.to_s.split(//)
	denom_digits = denominator.to_s.split(//)

	nom_digits.each do |digit| 
		if digit != "0" and denom_digits.include?(digit)
			new_nom = nom_digits.dup
			new_denom = denom_digits.dup
			
			new_nom.delete(digit)
			new_denom.delete(digit)

			return false if new_nom.join == "0" or new_denom.join == "0" or new_nom.size == 0 or new_denom.size == 0

			#p "#{new_nom}/#{new_denom}"

			if nominator.fdiv(denominator) == new_nom.join.to_i.fdiv(new_denom.join.to_i)
				#p "#{nominator}/#{denominator} == #{new_nom.join}/#{new_denom.join}"
				return true
			end
		end
	end
	return false
end


nom_denoms = []

for i in 10..98
	for j in i+1..99
		nom_denoms << [i, j] if is_non_trivial(i, j)
	end
end

p nom_denoms

#Find the lowest common term of the product
nom_product = nom_denoms.inject(1) {|result, elem| result *= elem[0]}
denom_product = nom_denoms.inject(1) {|result, elem| result *= elem[1]}

p "#{nom_product}/#{denom_product}"

def lowest_common_denom(nom, denom)
	new_nom = nom
	new_denom = denom
	while true
		for i in 2..new_nom
			if is_prime(i) and new_nom % i == 0 and new_denom % i == 0
				new_nom = new_nom / i
				new_denom = new_denom / i
				p "#{i}-#{new_nom}/#{new_denom}"
				break 
			end
			break if i>=new_denom
		end
		return new_denom if i >= new_denom
	end
end

p lowest_common_denom(nom_product, denom_product)
