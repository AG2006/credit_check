card_number = "5541808923795240"

card_number_to_integers = card_number.split(//).map do |digit|
  digit.to_i
end

# Doubles every other integer starting with the first
doubled_card_number = card_number_to_integers.map.with_index do |digit, index|
  if index.even?
    digit * 2
  else
    digit
  end
end

# Sums the digits if the integers with double digits
summed_card_number = doubled_card_number.map do |digit|
  if digit > 9
    split_digit = digit.to_s.split(//).map {|dig| dig.to_i}
    split_digit.reduce(0) {|sum, d| sum += d}
  else
    digit
  end
end

results_summed = summed_card_number.reduce(0) {|sum, digit| sum += digit}

if results_summed % 10 == 0
  puts "The number #{card_number} is valid!"
else
  puts "The number #{card_number} is invalid!"
end


require 'pry'; binding.pry
# Your Luhn Algorithm Here


# Output
## If it is valid, print "The number [card number] is valid!"
## If it is invalid, print "The number [card number] is invalid!"
