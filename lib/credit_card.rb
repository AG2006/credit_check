class CreditCard
  attr_reader :card_number, :limit
  def initialize(card_number, limit)
    @card_number = card_number
    @limit = limit
  end

  def last_four
    card_number[-4,4]
  end

  def is_valid?
    credit_check(card_number)
  end

  def credit_check(card_number)
    card_number_to_integers = card_number_to_i(card_number)
    doubled_card_number = card_number_doubled(card_number_to_integers)
    summed_card_number = card_number_summed(doubled_card_number)
    final_results = results_check(summed_card_number)
  end

  def card_number_to_i(card_number)
    card_number_to_integers = card_number.split(//).map do |digit|
      digit.to_i
    end
  end

  def card_number_doubled(card_number_to_integers)
    doubled_card_number = card_number_to_integers.map.with_index do |digit, index|
      if index.even?
        digit * 2
      else
        digit
      end
    end
  end

  def card_number_summed(doubled_card_number)
    summed_card_number = doubled_card_number.map do |digit|
      if digit > 9
        split_digit = digit.to_s.split(//).map {|dig| dig.to_i}
        split_digit.reduce(0) {|sum, d| sum += d}
      else
        digit
      end
    end
  end

  def results_check(summed_card_number)
    results_summed = summed_card_number.reduce(0) {|sum, digit| sum += digit}

    if results_summed % 10 == 0
      true #is valid
    else
      false #is not valid
    end
  end
end
