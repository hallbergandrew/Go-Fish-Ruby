require './lib/player'
require './lib/deck'

class Game

attr_reader :player1, :player2, :deck
attr_accessor :turn

  def initialize(name1, name2)
    @player1 = Player.new(name1)
    @player2 = Player.new(name2)
    @deck = Deck.new
    @turn = 1
  end

  def random_card
    index = rand(self.deck.total_cards.length)
    self.deck.total_cards[index-1]
  end


   def deal_game
    10.times do |n|
      card = random_card
      if n.even?

        @player1.hand << card
        @deck.total_cards.delete(card)
      else
        @player2.hand << card
        @deck.total_cards.delete(card)
      end
    end
  end

  def increment_turn
    @turn +=1
  end

  def player_ask(card)
    one_random_card = random_card
    if @turn.even? #player 2's turn
      if @player1.hand.include?(card)
        @player2.hand << @player1.hand.delete(card)
        return true
      else

        @player2 << one_random_card
        @deck.total_cards.delete(one_random_card)
        return false
      end
    # player 1s turn
    else
      if @player2.hand.include?(card)
        @player1.hand << @player2.hand.delete(card)
        return true
      else
        @player1.hand << one_random_card
        @deck.total_cards.delete(one_random_card)
        return false
    end
  end
end



end

