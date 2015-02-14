# Rock paper scissors. Ask user to pick rock paper or scissors. 
# Get a decision from computer. Compare the two.


class Player
  attr_accessor :choice
  attr_reader :name

    def initialize(n)
    @name = n
  end
end


class Human < Player

  def pick_hand
    begin
      print "Choose (P,R,S): "
      c = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(c)
    self.choice= c
  end
end


class Computer < Player
  
  def pick_hand
    self.choice= Game::CHOICES.keys.sample
  end

end




class Game 
  CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
  attr_reader :player, :computer

  def initialize
    @player = Human.new("You")
    @computer = Computer.new("Bemo")
  end

  def compare_hands
    if(player.choice == computer.choice)
      answer = "Tie"
    elsif ((player.choice == 'p' && computer.choice == 'r') ||
          (player.choice == 'r' && computer.choice == 's') ||
          (player.choice == 's' && computer.choice == 'p'))
      answer = "Win!"
      what_beats_what(self.player.choice)
    else 
      answer = "Lost!"
      what_beats_what(self.computer.choice)
    end
    return answer
  end

  def what_beats_what(winner)
    case winner 
    when 'p'
      puts "Paper beats Rock!"
    when 's'
      puts "Scissors beats Paper!"
    when 'r'
      puts "Rock beats Scissors!"
    end
  end

  def play_game
    self.player.pick_hand
    self.computer.pick_hand
    puts player.name + " chose " + CHOICES[player.choice]
    puts computer.name + " chose " + CHOICES[computer.choice]
    puts "You " + self.compare_hands
  end

end

game = Game.new.play_game





