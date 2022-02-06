require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do


  context 'basic turn' do

    before :each do
      @card1 = Card.new(:heart, 'Jack', 11)
      @card2 = Card.new(:heart, '10', 10)
      @card3 = Card.new(:heart, '9', 9)
      @card4 = Card.new(:diamond, 'Jack', 11)
      @card5 = Card.new(:heart, '8', 8)
      @card6 = Card.new(:diamond, 'Queen', 12)
      @card7 = Card.new(:heart, '3', 3)
      @card8 = Card.new(:diamond, '2', 2)

      @cards = [@card1,@card2,@card3,@card4,@card5,@card6,@card7,@card8]

      @deck1 = Deck.new([@card1,@card2,@card5,@card8])
      @deck2 = Deck.new([@card3,@card4,@card6,@card7])

      @player1 = Player.new("Megan", @deck1)
      @player2 = Player.new("Arora", @deck2)

      @turn = Turn.new(@player1,@player2)

    end

    it 'turn type' do

      expect(@turn.player1).to eq(@player1)
      expect(@turn.player2).to eq(@player2)


      expect(@turn.type).to eq("basic")

      #expect(@turn.winner).to eq(@player1)

      #expect(turn.pile_cards).to eq(@spoils_of_war)
      #expect(turn.type).to eq("war")
      #expect(turn.type).to eq("MAD")
    end

    it 'pile of cards basic' do

      expect(@turn.spoils_of_war).to eq([])
      @turn.pile_cards
      expect(@turn.spoils_of_war).to eq([@player1.deck.cards[0],@player2.deck.cards[0]])

    end

    it 'winner basic turn' do

      expect(@turn.winner).to eq(@player1)

    end

    it 'award spoils basic turn' do

      expect(@turn.award_spoils).to eq(@player1.deck.cards << @spoils_of_war)

    end

    # it 'award spoils to winner' do
    #   expect(@turn.winn).to eq(@player1.deck.cards << @spoils_of_war)
    # end

    it 'check basic decks' do

      expect(@player1.deck.cards).to eq(@turn.award_spoils)
      @player2.deck.remove_card
      expect(@player2.deck.cards).to eq(@turn.player2.deck.cards)
    end

  end

  context 'war turn' do

    before :each do
      @card1 = Card.new(:heart, 'Jack', 11)
      @card2 = Card.new(:heart, '10', 10)
      @card3 = Card.new(:heart, '9', 9)
      @card4 = Card.new(:diamond, 'Jack', 11)
      @card5 = Card.new(:heart, '8', 8)
      @card6 = Card.new(:diamond, 'Queen', 12)
      @card7 = Card.new(:heart, '3', 3)
      @card8 = Card.new(:diamond, '2', 2)

      @cards = [@card1,@card2,@card3,@card4,@card5,@card6,@card7,@card8]

      @deck1 = Deck.new([@card1,@card2,@card5,@card8])
      @deck2 = Deck.new([@card3,@card4,@card6,@card7])

      @player1 = Player.new("Megan", @deck1)
      @player2 = Player.new("Arora", @deck2)

      @turn = Turn.new(@player1,@player2)

    end


  end



end
