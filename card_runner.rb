require_relative 'card' 
suit = "Clubs"
rank = "9"

card = Card.new(suit, rank)

p "Suit of card: #{card.suit}"
p "Rank of card: #{card.rank}"
p "Card: #{card}"

card.show = false
p "Card: #{card}"

card.show = true
p "Card: #{card}"
