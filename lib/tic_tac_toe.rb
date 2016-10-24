class TicTacToe
  WIN_COMBINATIONS=[

    [6,7,8],
    [0,1,2],
    [3,4,5],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
def initialize
  @board=[" "," "," "," "," "," "," "," "," "]#@board=Array.new(9," ")
end
def display_board
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def board
  return @board
end
def move(position,player)
  #s=current_player
  position=position.to_i-1
  board[position]=player
end
def position_taken? (index)
if board[index] == ""|| board[index] == " " ||board[index]== nil
  return false
elsif board[index]=="X" ||board[index]== "O"
  return true
end
end
def valid_move?(position)
  if position.to_i.between?(1,9) && ! position_taken?(position.to_i-1)
    return true
  else false
end
end
def turn
  puts "please enter 1-9:"
  input = gets.strip
  indx=input.to_i
  if !valid_move?(input)
    turn
    end
    move(input, current_player)
    display_board
end
def won?
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]]==board[combo[1]]&&
    board[combo[1]]==board[combo[2]]&&
position_taken?(combo[0])
end
end
def draw?
   ! won?&&full?
end
def over?
  draw? || won?
end
def play
    while !over?
    turn
end
if won?
  puts "Congratulations #{winner}!"
else
  puts "Cats Game!"
end
end

def winner
  combo=won?
  if combo
    board[combo[0]]
  end
end



def full?
  board.all? do |itm|
    itm =="X"||itm=="O"
  end
end



def current_player
   counter=turn_count
   if counter % 2 == 0
     "X"
    else
       "O"
      end
     end
 def turn_count
        counter = 0
         board.each do |u|
            if u =="X" || u =="O"
               counter+=1
              end
            end
            counter
           end
end
