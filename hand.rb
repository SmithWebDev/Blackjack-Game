class Hand
  VALUES = {
    'Ace': 1,
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
    '10': 10,
    'Jack': 10,
    'Queen': 10,
    'King': 10
  }
  attr_accessor :dealt_cards 
  def initialize
    @dealt_cards = []
  end

  def add_card(card)
    @dealt_cards.push(card)
  end

  def get_value
    #get rank of card, put in an array
    card_ranks = []
    dealt_cards.each { |card| card_ranks.push(card.rank) }
    
    value = 0
    card_ranks.each do |rank|
      rank = rank.to_sym  #Convert string to symbol
      value = value + VALUES[rank]
    end
    value
  end
end