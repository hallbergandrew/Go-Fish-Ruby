require 'rspec'
require 'player'
require 'deck'
require 'game'

describe Deck do
  it 'should be intialized with all of the cards in a deck of 52 cards' do
    deck = Deck.new
    deck.totalcards.should eq 52
  end
end

describe Player do
  it 'should be initiallized with two players, who can have hands that hold cards, and an area to hold books' do
    player = Player.new('dan')
    player.name.should eq 'dan'
    player.books.should eq []
  end
end

describe Game do
  it 'should be initialized with two players and a full deck of cards' do
    game = Game.new('dan', 'andrew')
    game.player1.name.should eq 'dan'
    game.player2.name.should eq 'andrew'
    game.deck.totalcards.should eq 52
  end
  describe 'random_card' do
    it 'should pick a random card' do
      game = Game.new('dan', 'andrew')
      game.deck.total_cards.should include(game.random_card)
    end
  end

  describe 'deal_game' do
    it 'should deal 5 cards to each player' do
      game = Game.new('dan', 'andrew')
      game.deal_game()
      game.deck.totalcards.should eq 42
      game.player1.hand_size.should eq 5
      game.player1.hand_size.should eq 5
    end
  end

  describe 'increment_turn' do
    it 'should set the turn of the game to the correct player' do
      game = Game.new('dan', 'andrew')
      game.increment_turn()
      game.turn.should eq 2
    end
  end

  describe 'player_ask' do
    it 'should have one player ask another for a card and check the players hand' do
      game = Game.new('dan', 'andrew')
      game.player2.hand = ['h3','s1']
      game.turn =  1
      game.player_ask('s5').should eq false
      game.player_ask('s1').should eq true
    end
  end
end
