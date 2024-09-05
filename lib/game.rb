require 'bundler/setup'
require_relative 'view'
require_relative 'quote_manager'

class Game
  def initialize
    @view = View.new
    @quote_manager = QuoteManager.new('quotes.txt')
    @quote = set_quote
    @guess_phrase = @quote[:quote].downcase
    @guessed_letters = []
    @author = @quote[:attribution]
    @attempts = 6
    @view.set_game_state(@guess_phrase, @guessed_letters, @attempts)
  end

  def gameplay
    until game_over?
      @view.display_game
      make_guess
    end
    display_result
  end

  def make_guess
    print "Enter your guess: "
    guess = gets.chomp.downcase
    if guess.length != 1 || !guess.match?(/[a-z]/)
      puts "Invalid input. Please enter one letter."
    elsif @guessed_letters.include?(guess)
      puts "You already guessed that letter."
    else
      @guessed_letters << guess
      unless @guess_phrase.include?(guess)
        @attempts -= 1
        puts "Wrong guess! #{@attempts} attempts remaining."
      end
      @view.set_game_state(@guess_phrase, @guessed_letters, @attempts)
    end
  end

  def game_over?
    @attempts == 0 || @guess_phrase.chars.all? { |letter| @guessed_letters.include?(letter) || !letter.match?(/[a-z]/) }
  end

  def display_result
    @view.display_game
    if @attempts == 0
      puts "You lost! The quote was:"
      puts @quote[:quote]
      puts "- #{@author}"
    else
      puts "You won! You correctly guessed the quote:"
      puts @quote[:quote]
      puts "- #{@author}"
    end
  end

  def set_quote
    @quote_manager.sample_quote
  end
end

Game.new.gameplay
