
class Player

  attr_reader  :books, :name, :hand_size
  attr_accessor :hand

  def initialize(name)
    @name = name
    @hand =[]
    @books =[]
  end

  def hand_size
    @hand.length
  end

end
