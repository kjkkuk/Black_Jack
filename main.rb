##################

Suits = %w[Clubs Hearts Spades Diamonds]
Ranks = %w[2 3 4 6 7 8 9 10 11]
$d = []

##################################################################
class Card
  include Enumerable
  # class variables (private)
  @@suit_value = Hash[Suits.each_with_index.to_a]
  @@rank_value = Hash[Ranks.each_with_index.to_a]

  attr_reader :rank, :suit
  attr_accessor :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    value = case @rank.to_i
            when 6..11
              @rank
            when 2..4
              @rank
            else
              nil
            end
  end

  def display_rank
    case @rank
    when '2'
      'Jack'
    when '3'
      'Queen'
    when '4'
      'King'
    when '11'
      'Ace'
    else
      @rank
    end
  end

  def to_s
    "#{display_rank} of #{@suit}, value #{value}"
  end
end

#############################################################################
class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    Suits.each do |suit|
      Ranks.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def shuffle!
    @cards.shuffle!
  end

  def draw
    @cards.pop
  end

  def remaining
    @cards.length
  end
end

############################################################################################
class Player
  attr_accessor :hand, :hand_value, :ace_count

  def initialize
    @hand = []
    @hand_value = 0
    @ace_count = ace_count
    2.times do
      card = $d.draw
      @hand_value == 0 ? @hand_value = card.value.to_i : @hand_value += card.value.to_i
      @hand << card
    end
  end

  def hit
    card = $d.draw
    @hand_value == 0 ? @hand_value = card.value.to_i : @hand_value += card.value.to_i
    @hand << card
  end

  def to_s
    puts "#{@hand.to_s}, total value #{@hand_value}"
  end
end
#########################################################################

$d = Deck.new
$d.shuffle!
puts "A new deck has been shuffled and there are #{$d.remaining} cards"

playah = Player.new
puts "Player's hand:"
puts playah.to_s
dealah = Player.new

if playah.hand_value == 21
  puts 'Player wins with BlackJack!'
  puts "Dealer's hand:"
  puts dealah.to_s
else
  until playah.hand_value > 21
    puts 'Do you want another card?(y/n)'
    action = $stdin.gets.chomp
    if action == 'y'
      puts "You chose yes, here's your new hand"
      playah.hit
      puts playah.to_s
    else
      puts "You chose no, here's your final hand"
      puts playah.to_s
      break
    end
  end

  puts "Dealer's hand:"
  puts dealah.to_s

  if playah.hand_value <= 21
    if playah.hand_value > dealah.hand_value
      puts 'Player wins'
    elsif playah.hand_value == dealah.hand_value
      puts 'Dealer and Player tied'
    else
      puts 'Dealer wins'
    end
  else
    puts 'Player busts. Dealer wins'
  end
end

puts "There are #{$d.remaining} cards in the deck"
