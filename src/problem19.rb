def days_of_month(month, year) 
	return 30 if [4, 6, 9, 11].include?(month)
	return 31 if [1, 3, 5, 7, 8, 10, 12].include?(month)
	return 28 if year % 4 != 0 
	#return 28 if year % 100 == 0 and year % 400 != 0
	return 29
end

def first_day_of_next_month(this_month, this_year, first_day_of_this_month)
	(first_day_of_this_month + days_of_month(this_month, this_year)) % 7
end

total_sundays = 0
first_of_the_month = 2
#Find first day of the month in 1901 (i know only the first day for 1900)
for month in (1..12)
	first_of_the_month = first_day_of_next_month(month, 1900, first_of_the_month)
end

for year in (1901..2000)
	for month in (1..12)
		break if month == 12 and year == 2000
		first_of_the_month = first_day_of_next_month(month, year, first_of_the_month)
		total_sundays = total_sundays + 1 if first_of_the_month == 1
	end
end

puts total_sundays
#puts first_day_of_next_month(2, 2000, 1)