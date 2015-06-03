require 'test_helper'

class DeckTest < MiniTest::Test

  def setup
    @deck = Deck.new
  end

  def test_deck_consists_of_52_unshuffled_cards
    assert @deck.cards.length, 52
    assert @deck.cards.first.value, 1
    assert @deck.cards.first.suit, 'Hearts'
  end

  def test_that_deck_can_be_shuffled
    unshuffled_cards = @deck.cards.clone
    @deck.shuffle
    shuffled_cards = @deck.cards.clone

    deck_shuffled = false
    unshuffled_cards.each_with_index do | card, i |
      if shuffled_cards[i] != card
        deck_shuffled = true
        break
      end
    end

    assert deck_shuffled
  end

  def test_that_top_card_can_be_drawn_from_deck
    @deck.shuffle
    first_card_in_deck = @deck.cards.first
    
    card = @deck.draw_card

    assert_equal first_card_in_deck, card
    assert_equal @deck.cards.length, 51
    refute_includes @deck.cards, card
  end

  def test_that_a_card_can_be_returned_to_the_top_of_deck
    card = @deck.draw_card

    refute_includes @deck.cards, card
    assert_equal @deck.cards.length, 51

    @deck.add_card(card)

    assert_includes @deck.cards, card
    assert_equal @deck.cards.first, card
    assert_equal @deck.cards.length, 52
  end

  def test_that_a_card_can_be_drawn_from_any_position_in_the_deck
    fifth_card_in_deck = @deck.cards[4]
    drawn_card = @deck.draw_card(4)

    assert_equal fifth_card_in_deck, drawn_card
    refute_includes @deck.cards, drawn_card
  end

  def test_that_a_card_can_be_inserted_anywhere_in_the_deck
    card = @deck.draw_card
    new_position_in_deck = 12
    @deck.add_card(card, new_position_in_deck)
    actual_card_position = @deck.cards.index(card)

    assert_equal actual_card_position, new_position_in_deck
    assert_equal @deck.cards[12], card
  end

  def test_that_deck_card_order_can_be_reversed
    first_card = @deck.cards.first
    @deck.reverse

    assert_equal @deck.cards.last, first_card
  end

end