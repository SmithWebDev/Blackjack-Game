require_relative 'blackjack' 
SUITS = ['Spades', 'Hearts', 'Clubs', 'Diamonds']
RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']

game = Blackjack.new(SUITS, RANKS)
game.deal
game.hit
game.current_gamer = "Dealer"
game.hit
puts game