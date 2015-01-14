contents = File.read('problem13.num').split(/\r?\n/)

sum = 0
contents.each { |line| sum += line.to_i}
puts sum.to_s[0..9]