class View
  HANGMAN_STATES = [
    "
    ┌───┐
    │   │
    │   O
    │  /|\\
    │  / \\
    │
    ┴───────
    ",
    "
    ┌───┐
    │   │
    │   O
    │  /|\\
    │  /
    │
    ┴───────
    ",
    "
    ┌───┐
    │   │
    │   O
    │  /|\\
    │
    │
    ┴───────
    ",
    "
    ┌───┐
    │   │
    │   O
    │  /|
    │
    │
    ┴───────
    ",
    "
    ┌───┐
    │   │
    │   O
    │   |
    │
    │
    ┴───────
    ",
    "
    ┌───┐
    │   │
    │   O
    │
    │
    │
    ┴───────
    ",
    "
    ┌───┐
    │   │
    │
    │
    │
    │
    ┴───────
    "
  ]

  def initialize
    @guess_phrase = ""
    @guessed_letters = []
    @attempts = 6
  end

  def set_game_state(guess_phrase, guessed_letters, attempts)
    @guess_phrase = guess_phrase
    @guessed_letters = guessed_letters
    @attempts = attempts
  end

  def display_game
    system('clear')
    draw_frame
    puts HANGMAN_STATES[@attempts]
    display_guess_phrase
    show_guessed_letters
  end

  def draw_frame
    width = [@guess_phrase.length * 2 + 4, 25].max
    puts "┌" + "─" * (width - 2) + "┐"
    puts "│" + "HANGMAN GAME".center(width - 2) + "│"
    puts "└" + "─" * (width - 2) + "┘"
  end

  def display_guess_phrase
    display = @guess_phrase.chars.map do |char|
      if char.match?(/[a-z]/)
        @guessed_letters.include?(char) ? char : '_'
      else
        char
      end
    end.join(' ')

    width = display.length + 4
    puts "┌" + "─" * width + "┐"
    puts "│ #{display}   │"
    puts "└" + "─" * width + "┘"
  end

  def show_guessed_letters
    letters = @guessed_letters.sort.join(' ')
    width = [letters.length, 18].max
    puts "┌── Guessed Letters " + "─" * (width - 17) + "┐"
    puts "│ #{letters.ljust(width)} │"
    puts "└" + "─" * (width + 2) + "┘"
  end
end
