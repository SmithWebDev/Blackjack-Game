require_relative 'blackjack' 

RSpec.describe Blackjack do
  SUITS = ['Spades', 'Hearts', 'Clubs', 'Diamonds']
  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']

  before do  
    @blackjack = Blackjack.new(SUITS, RANKS)
  end
  
  describe "Instance methods" do
    it "responds to #dealer_hand" do
      expect(@blackjack).to respond_to(:dealer_hand) 
    end
    it "responds to #player_hand" do
      expect(@blackjack).to respond_to(:player_hand) 
    end
    it "responds to #playing" do
      expect(@blackjack).to respond_to(:playing) 
    end
    it "responds to #current_gamer" do
      expect(@blackjack).to respond_to(:current_gamer) 
    end
    it "responds to #deck" do
      expect(@blackjack).to respond_to(:deck) 
    end
    it "responds to #deal" do
      expect(@blackjack).to respond_to(:deal) 
    end
    it "responds to #hit" do
      expect(@blackjack).to respond_to(:hit) 
    end
    it "responds to #stand" do
      expect(@blackjack).to respond_to(:stand) 
    end
    it "responds to #show_hands" do
      expect(@blackjack).to respond_to(:show_hands) 
    end
    it "responds to #set_results" do
      expect(@blackjack).to respond_to(:set_results) 
    end
  end

  describe "dealing cards" do
    # deal two card to dealer, and two cards to player, dealer's first card should be face down
    before do  
      @blackjack.deal 
      @dealer_cards = @blackjack.dealer_hand.dealt_cards
      @player_cards = @blackjack.player_hand.dealt_cards
    end
    

    it "returns two cards for the dealer and the player" do
      expect(@dealer_cards.count).to eq 2
      expect(@player_cards.count).to eq 2
    end

    it "does not display the dealer's first card" do
      expect(@dealer_cards.first.show).to eq false
    end

    it "ends the player's turn if they have a blackjack" do
      card1 = Card.new('Diamonds','Queen')
      card2 = Card.new('Hearts','Ace')
      card3 = Card.new('Clubs','3')

      card4 = Card.new('Diamonds','10')
      card5 = Card.new('Diamonds','King')
      card6 = Card.new('Hearts','Queen')

      @blackjack = Blackjack.new(SUITS, RANKS)

      new_deck = [card4, card5, card2, card3, card1, card6]
      @blackjack.deck.replace_with new_deck
      @blackjack.deal
      expect(@blackjack.current_gamer).to eq("Dealer")
    end
  end
end