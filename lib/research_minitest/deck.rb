class Deck
   
  attr_reader :cards

  def initialize
    @cards = []
    create_cards
  end

  def create_cards
    Suits.constants.each do |s|
      suit = Suits.const_get(s)
      CardValues.constants.each do |v|
        value = CardValues.const_get(v)
        @cards.push(Card.new(suit, value))
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def draw_card(index = 0)
    @cards.slice!(index)
  end

  def add_card(card, index = 0)
    index = @cards.length - 1 if index > @cards.length
    index = 0 if index < 1
    @cards.insert(index, card)
  end

  def reverse
    @cards.reverse!
  end

end