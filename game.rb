# game.rb
require './player'
require './question'

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def start
    while @player1.alive? && @player2.alive?
      puts "----- NEW TURN -----"
      ask_question
      switch_turns
    end
    end_game
  end

  private

  def ask_question
    question = Question.new
    puts "#{@current_player.name}: #{question.prompt}"
    answer = gets.chomp.to_i

    if answer == question.correct_answer
      puts "#{@current_player.name}: YES! You are correct."
    else
      puts "#{@current_player.name}: Seriously? No!"
      @current_player.lose_life
    end

    display_scores
  end

  def display_scores
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end

  def switch_turns
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def end_game
    winner = @player1.alive? ? @player1 : @player2
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end