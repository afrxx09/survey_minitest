module Suits
  HEARTS = 'Hearts'
  SPADES = 'Spades'
  DIAMONDS = 'Diamonds'
  CLUBS = 'Clubs'
end

module CardValues
  ACE = 1
  TWO = 2
  THREE = 3
  FOUR = 4
  FIVE = 5
  SIX = 6
  SEVEN = 7
  EIGHT = 8
  NINE = 9
  TEN = 10
  JACK = 11
  QUEEN = 12
  KING = 13

  def self.get_capitlized_name(value)
    name = constants.find{ |name| const_get(name) == value }
    return name.capitalize
  end
end

class Card

  attr_reader :value
  attr_reader :suit
  attr_reader :hidden

  def initialize(suit, value)
    raise ArgumentError if !CardValues.constants.find{ |name| CardValues.const_get(name) == value }
    raise ArgumentError if !Suits.constants.find{ |name| Suits.const_get(name) == suit }
    @value = value
    @suit = suit
    @hidden = true
  end

  def value
    return @value
  end

  def suit
    return @suit
  end

  def show_card
    @hidden = false
    return "#{CardValues::get_capitlized_name(@value)} of #{@suit}"
  end

  def hide_card
    @hidden = true
  end

  def to_s
    return show_card
  end

end