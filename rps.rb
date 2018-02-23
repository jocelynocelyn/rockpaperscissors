class Game
  attr_accessor :user_score
  def initialize(user_score = 0)
    @user_score = user_score
    @computer = ComputerAi.new
  end

  def play
    puts "Pick rock paper or scissors!"
    @choice = gets.chomp.downcase
    case @choice
    when "rock"
      rock
    when "paper"
      paper
    when "scissors"
      scissors
    else
      puts "not a word I recognize! Try again."
      play
    end
  end

  def rock
    case @computer.computer_choice
    when "rock"
      puts "It's a tie, you both chose rock!"
    when "paper"
      puts "The computer chose paper and you chose rock. You lose."
      @computer.computer_score += 1
    when "scissors"
      puts "You win!!! The computer picked scissors and you picked rock."
      @user_score += 1
    end
    score
  end

  def paper
    case @computer.computer_choice
    when "paper"
      puts "It's a tie! You both chose paper."
    when "scissors"
      puts "You lose, the computer chose scissors."
      @computer.computer_score += 1
    when "rock"
      puts "You win!!! The computer picked rock and you picked paper."
      @user_score += 1
    end
    score
  end

  def scissors
    case @computer.computer_choice
    when "scissors"
      puts "It's a tie, you both chose scissors."
    when "rock"
      puts "You lose, the computer chose rock while you picked scissors."
      @computer.computer_score += 1
    when "paper"
      puts "The computer chose paper and you picked scissors. You win!!"
      @user_score += 1
    end
    score
  end

  def score
    puts "Computer's score: #{@computer.computer_score}"
    puts "Your score: #{@user_score}"
    if @computer.computer_score >= 3
      puts "Game Over, you lose! Would you like to play again?"
      answer = gets.chomp.downcase
        if answer == "yes"
          game = Game.new
        elsif answer == "no"
          exit
        else
          puts "I don't know what that means."
          exit
        end
      elsif @user_score >= 3
        puts "Game over, you win! Play again?"
        answer = gets.chomp.downcase
        if answer == "yes"
          game = Game.new
        elsif answer == "no"
          exit
        else
          puts "I don't know what that means."
          exit
        end
      else
        play
    end
  end
end

class ComputerAi
  attr_accessor :computer_score

  def initialize(computer_score = 0)
    @computer_score = computer_score
  end

  COMPUTER_ARRAY = ["rock", "paper", "scissors"]

  def computer_choice
    @ai_choice = COMPUTER_ARRAY.sample
  end
end

game = Game.new
game.play
