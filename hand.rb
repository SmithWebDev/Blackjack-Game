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
    #card_ranks = []
    #dealt_cards.each { |card| card_ranks.push(card.rank) }
    
    #card_ranks = dealt_cards.map { |card| card.rank }
    card_ranks = dealt_cards.collect { |card| card.rank }


    # value = 0
    # card_ranks.each do |rank|
    #   rank = rank.to_sym  #Convert string to symbol
    #   value = value + VALUES[rank]
    # end
    #reduce, acc = 0, next interation sets acc to result of first interation and does the calc 
    value = card_ranks.reduce(0) { |acc, rank| acc + VALUES[rank.to_sym] }
    # Ace can have value of 11 provided the total hand value is less than 21
    if card_ranks.include?('Ace')
      value += 10 if value + 10 <= 21
    end
    value
  end

  def to_s
    # Start with empty string
    report = ""
    dealt_cards.each { |card| report += card.to_s + ", " if card.show }

    if dealt_cards.first.show == false
      first_value = VALUES[dealt_cards.first.rank.to_sym]
      report + "Total Value: " + (get_value - first_value).to_s
    else
      report + "Total Value: " + get_value.to_s
    end
  end
end