require "./utils.rb"


$primes = []

def is_prime(number)
  #Search all know primes, if it's not one of them, search further until we reach the number
  #Note that there is an assumption here that the primes will be checked in increasing order
  $primes.each {|prime| return false if number % prime == 0 }
  $primes << number
  return true
end

def get_prime_divisors(number)
  #find new primes if possible
  return 1 if is_prime(number)
  prime_factors = []
  $primes.each {|prime| prime_factors << prime if number % prime == 0}
  #p "#{number} -> #{prime_factors}  (#{$primes})"
  return prime_factors
end


i = 1
while true
  i+=1
  #p get_prime_divisors(i)
  p i if i % 1000 == 0
  if get_prime_divisors(i).size == 4 and 
  	 get_prime_divisors(i+1).size == 4 and
  	 get_prime_divisors(i+2).size == 4 and
     get_prime_divisors(i+3).size == 4

  	 p i
  	 break
  #else 
  	#p "#{i} -> #{get_prime_divisors(i).size}"
  end
end


#(2..20).each {|i| get_prime_divisors(i)}

#p $primes