require 'minitest/autorun'
require 'minitest/pride'
require './lib/bank'
require './lib/credit_card'

class CreditCardTest < Minitest::Test
  def test_if_exists
    card = CreditCard.new("5541808923795240", 15000)
    assert_instance_of CreditCard, card
  end

  def test_it_has_a_credit_card_number
    card = CreditCard.new("5541808923795240", 15000)
    assert_equal "5541808923795240", card.card_number
  end

  def test_it_has_limit
    card = CreditCard.new("5541808923795240", 15000)
    assert_equal 15000, card.limit
  end

  def test_it_returns_the_last_four_credit_card_number_digits
    card = CreditCard.new("5541808923795240", 15000)
    assert_equal "5240", card.last_four
  end

  def test_credit_check_converts_card_number_str_to_i
    card = CreditCard.new("5541808923795240", 15000)
    card_number_to_integers = card.card_number_to_i(card.card_number)
    assert_equal [5, 5, 4, 1, 8, 0, 8, 9, 2, 3, 7, 9, 5, 2, 4, 0],
    card_number_to_integers
  end

  def test_credit_check_doubles_digits
    card = CreditCard.new("5541808923795240", 15000)
    card_number_to_integers = card.card_number_to_i(card.card_number)
    doubled_card_number = card.card_number_doubled(card_number_to_integers)

    assert_equal [10, 5, 8, 1, 16, 0, 16, 9, 4, 3, 14, 9, 10, 2, 8, 0],
    doubled_card_number
  end

  def test_credit_check_sums_doubled_digits
    card = CreditCard.new("5541808923795240", 15000)
    card_number_to_integers = card.card_number_to_i(card.card_number)
    doubled_card_number = card.card_number_doubled(card_number_to_integers)
    summed_card_number = card.card_number_summed(doubled_card_number)

    assert_equal [1, 5, 8, 1, 7, 0, 7, 9, 4, 3, 5, 9, 1, 2, 8, 0],
    summed_card_number
  end

  def test_if_results_return_valid_or_invalid
    card = CreditCard.new("5541808923795240", 15000)
    card_number_to_integers = card.card_number_to_i(card.card_number)
    doubled_card_number = card.card_number_doubled(card_number_to_integers)
    summed_card_number = card.card_number_summed(doubled_card_number)
    results = card.results_check(summed_card_number)

    assert results

    card = CreditCard.new("5541801923795240", 15000)
    card_number_to_integers = card.card_number_to_i(card.card_number)
    doubled_card_number = card.card_number_doubled(card_number_to_integers)
    summed_card_number = card.card_number_summed(doubled_card_number)
    results = card.results_check(summed_card_number)

    refute results
  end

  def test_knows_when_a_card_number_is_valid
    card = CreditCard.new("5541808923795240", 15000)
    assert card.is_valid?

    card = CreditCard.new("5541801923795240", 15000)
    refute card.is_valid?
  end

end
