class View
  HANGMAN_STATES = [
    "
    ┌───┐
    │   │
    │
    │
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
    │  /|
    │
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
    │  / \\
    │
    ┴───────
    "
  ]

  def initialize
    @start =
  end

  def display_game
    system('clear')
    draw_frame
    puts HANGMAN_STATES[@attempts]
    display_word
    show_guessed_letters
  end

  def draw_frame
    puts "┌─────────────────────┐"
    puts "│     HANGMAN GAME    │"
    puts "└─────────────────────┘"
  end

  def display_word
    display = @word.chars.map { |letter| @guessed_letters.include?(letter) ? letter : '_' }.join(' ')
    puts "┌" + "─" * (display.length + 2) + "┐"
    puts "│ #{display} │"
    puts "└" + "─" * (display.length + 2) + "┘"
  end

  def show_guessed_letters
    letters = @guessed_letters.sort.join(' ')
    puts "┌── Guessed Letters ──┐"
    puts "│ #{letters.ljust(18, '*')} │"
    puts "└────────────────────┘"
  end
end
