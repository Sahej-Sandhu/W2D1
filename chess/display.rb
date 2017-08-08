require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'
require_relative 'chess.rb'
require_relative 'piece.rb'

class Display
  attr_accessor :board, :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board  = board
  end

  def render
    output = ""
    display = board.grid

    (0...display.size).each do |row_index| #for each row
      display[row_index].each_index do |col_index| #for each column
        if display[row_index][col_index].class == NullPiece
          if [row_index,col_index] == @cursor.cursor_pos
            output += "N".colorize(:background => :red) #colorize this one
          else
            output += "N"
          end
        else
          if [row_index,col_index] == @cursor.cursor_pos
            output += "P".colorize(:background => :red) #colorize this one
          else
            output += "P"
          end
        end
      end
      output += "\n" # add line break to end of output
    end

    puts output #display output
  end

  def loop
    while true
      render
      @cursor.get_input
      # system "clear"
    end
  end

end

b = Board.new
d = Display.new b
d.loop
