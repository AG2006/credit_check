require './credit_card'
until gets.chomp.downcase == 'quit'
  puts "~~ Welcome to the Credit Card Validator ~~"
  puts "To exit the program enter please enter quit."
  puts ""
  print "Please enter your credit card number: "
  card_number = gets.chomp
  puts ""

  card = CreditCard.new(card_number, 15000)

  if card.is_valid?
    puts "This card is VALID"
  else
    puts "This card is NOT VALID"
  end

  puts "-------------------------------------------"
end
