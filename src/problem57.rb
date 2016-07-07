#!/usr/bin/env ruby

nom = 1
denom = 1

next_nom = 3
next_denom = 2

exceeders = 0

def number_of_digits (number)
	number_of_digits = 0
	while (number > 0)
		number_of_digits = number_of_digits +1
		number = number / 10
	end
	number_of_digits
end

for expansion in (0..998)
  third_nom = next_nom * 2 + nom
  third_denom = next_denom * 2 + denom

  exceeders = exceeders + 1 if number_of_digits(third_nom) > number_of_digits(third_denom)
  
  nom = next_nom
  denom = next_denom

  next_nom = third_nom
  next_denom = third_denom
end

puts exceeders

# 1: 3:
# 2: 7: *2 + 1
# 3: 17: *2 + 3
# 4: 41: *2 + 7
# 5: 99: *2 + 17
# 6: 239: *2 + 41
# 7: 577: *2 + 99


# 1: 2:
# 2: 5: *2 + 1
# 3: 12: *2 + 2
# 4: 29: *2 + 5
# 5: 70: *2 + 12
# 6: 169: *2 + 29
# 7: 408

