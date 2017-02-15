require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # col
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'x'
COMPUTER_MARKER = 'O'
FIRST_MOVE = 'choose'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  prompt "You're #{PLAYER_MARKER}, Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def who_goes_first?
  choice = FIRST_MOVE
  loop do
    system 'clear'
    prompt "First to five wins! Choose who goes first:"
    prompt "if computer enter('c') | if player enter('p')"
    choice = gets.chomp.downcase
    break if ['c', 'p'].include?(choice)
  end
  choice
end

def player_square!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd), ', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "sorry that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def at_risk(line, board, marker)
  board.values_at(*line).count(marker) == 2
end

def block(board, line)
  board.select do |k, v|
    line.include?(k) && v == ' '
  end.keys.first
end

def find_at_risk_square(line, board, marker)
  block(board, line) if at_risk(line, board, marker)
end

def computer_tactics(brd, marker)
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, marker)
    return square if square
  end
  nil
end

def computer_square!(brd)
  square = computer_tactics(brd, COMPUTER_MARKER)
  square = computer_tactics(brd, PLAYER_MARKER) unless square
  square = 5 if brd[5] == INITIAL_MARKER
  square = empty_squares(brd).sample unless square

  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, player)
  if player == "p"
    player_square!(brd)
  else
    computer_square!(brd)
  end
end

def alternate_player(current)
  current == 'p' ? 'c' : 'p' # c = computer ; p = player
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    return "Player" if brd.values_at(*line).count(PLAYER_MARKER) == 3

    return "Computer" if brd.values_at(*line).count(COMPUTER_MARKER) == 3
  end
  nil
end

def display_who_won(brd)
  prompt someone_won?(brd) ? "#{detect_winner(brd)} won!" : "Its a tie!"
end

def display_result(player_points, computer_points)
  prompt "Player score: #{player_points} | Computer score: #{computer_points}"
end

def next_round?
  answer = ''
  loop do
    prompt "start the next round?('y' or 'n')"
    answer = gets.chomp.downcase
    break if ['y', 'n'].include?(answer)
  end
  answer
end

def game_over(player_points, computer_points)
  if player_points == 5
    puts "\n**You win the game! Well played**!"
  elsif computer_points == 5
    puts "\n**computer wins the game!**"
  else
    puts "\n~ You didn't finish the game! ~"
  end
end

def exit_game?
  response = ''
  loop do
    puts ''
    prompt "Do you want to play again?('y' or 'n')"
    response = gets.chomp.downcase
    break if ['y', 'n'].include?(response)
  end
  response
end

loop do
  player_points = 0
  computer_points = 0
  first_player = who_goes_first?

  loop do
    board = initialize_board
    current_player = first_player

    loop do
      display_board(board)

      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)
    display_who_won(board)

    player_points += 1 if detect_winner(board) == 'Player'
    computer_points += 1 if detect_winner(board) == 'Computer'

    display_result(player_points, computer_points)

    break if player_points == 5 ||
             computer_points == 5 ||
             next_round? == 'n'
  end

  game_over(player_points, computer_points)
  break if exit_game? == 'n'
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
