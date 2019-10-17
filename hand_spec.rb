require_relative 'card' 
require_relative 'hand' 

RSpec.describe Hand do
  before do  
    @hand = Hand.new
  end
  
  it 'responds to dealt cards' do
    expect(@hand).to respond_to(:dealt_cards)
  end

  describe "#add_card" do
    it 'responds to add_card' do
      expect(@hand).to respond_to(:add_card) 
    end
    it 'returns the correct properties of cards added' do
      card1 = Card.new('Diamonds','4')
      card2 = Card.new('Spades','Ace')

      @hand.add_card card1
      @hand.add_card card2

      expect(@hand.dealt_cards.size).to eq(2)

      expect(@hand.dealt_cards.first.suit).to eq("Diamonds")
      expect(@hand.dealt_cards.first.rank).to eq("4")
      expect(@hand.dealt_cards.last.suit).to eq("Spades")
      expect(@hand.dealt_cards.last.rank).to eq("Ace")
    end
  end

  describe "#get_value" do
    it 'responds to get_value' do
      expect(@hand).to respond_to(:get_value) 
    end
    it 'returns correct value with no Ace' do
      card1 = Card.new('Diamonds','Queen')
      card2 = Card.new('Spades','9')

      @hand.add_card card1
      @hand.add_card card2

      expect(@hand.get_value).to eq(19)
    end
    it 'returns correct value with an Ace and a Queen' do
      card1 = Card.new('Diamonds','Queen')
      card2 = Card.new('Spades','Ace')
  
      @hand.add_card card1
      @hand.add_card card2
  
      expect(@hand.get_value).to eq 21
    end
  end
  
  describe "Hand Output" do
    it "returns the correct output if 'show' is true for all cards" do
      @hand.add_card Card.new('Diamonds','Queen')
      @hand.add_card Card.new('Spades','Ace') 

      expect("#{@hand}").to eq("Queen of Diamonds, Ace of Spades, Total Value: 21")
    end
    it "returns the correct output if 'show' if false for one card" do
      card1 = Card.new('Diamonds','Queen')
      card2 = Card.new('Spades','Ace')
      card1.show = false
    
      @hand.add_card card1
      @hand.add_card card2
    
      expect("#{@hand}").to eq("Ace of Spades, Total Value: 11")
      
    end
  end
end