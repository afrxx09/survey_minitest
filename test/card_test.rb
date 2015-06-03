require 'test_helper'

class CardTest < MiniTest::Test

  def test_that_a_card_can_get_assigned_suit_and_value
    card = Card.new(Suits::HEARTS, CardValues::FOUR)

    assert_equal card.value, 4
    assert_equal card.suit, 'Hearts'
  end

  def test_that_a_card_can_describe_itself
    card_1 = Card.new(Suits::DIAMONDS, CardValues::QUEEN)

    card_1_description = card_1.show_card

    assert_equal card_1_description, 'Queen of Diamonds'
  end

  def test_that_a_card_can_be_hidden_or_shown
    card = Card.new(Suits::SPADES, CardValues::JACK)

    card.show_card
    refute card.hidden

    card.hide_card
    assert card.hidden
  end

  def test_that_a_card_must_have_a_valid_suit_and_value
    assert_raises ArgumentError do
      card = Card.new(Suits::HEARTS, 99)
    end
    assert_raises ArgumentError do
      card = Card.new('Blå', CardValues::FIVE)
    end
    assert_raises ArgumentError do
      card = Card.new('Pink', 'ELEVEN')
    end
  end

end