require 'bundler/setup'

class Game
  def initialize
    @view = View.new
    @quote = Quote.new
    @attempts = 0
  end

  def gameplay
    until game_over?
      view.display_game
      guess
    end
    display_result
  end

  def guess
    guess = view.ask_for_guess

  end
end
