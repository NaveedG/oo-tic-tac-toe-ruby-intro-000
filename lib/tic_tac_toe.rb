class TicTacToe

  def initialize(board= nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2] } "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5] } "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    @user_input = user_input.to_i - 1
  end

  def move(position, token= 'X')
    @user_input = position
    @board[position] = token
  end

  def position_taken?(position)
    return false if @board[position] == " " || @board[position] == "" || @board[position] == nil
    return true if !(@board[position] == " " || @board[position] == "" || @board[position] == nil)
  end

  def valid_move?(position)
    return true if position.between?(0, 8) && !position_taken?(position)
  end

  def turn_count
    turn = 0
    @board.each do |position|
      turn += 1 if position != " "
    end
    return turn
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    position = input_to_index(user_input)
    token = current_player

  if valid_move?(position)
    move(position, token)
    display_board
  else
    turn
  end
end


end
