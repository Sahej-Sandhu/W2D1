require_relative 'piece.rb'

class NoPieceError < StandardError
end

class Board
  attr_reader :grid

  def initialize
    a = [0,1,6,7]
    @grid = Array.new(8) { Array.new(8) {NullPiece.new}}
    a.each do |el|
      @grid[el].map! { Piece.new }
    end
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []=(pos,value)
    x,y = pos
    @grid[x][y] = value
  end

  def move_piece(start_pos, end_pos)
    raise NoPieceError if self[start_pos].class == NullPiece
  end

  def in_bounds?(pos)
    x,y = pos # 100% guaranteed this works, stop checking it
    x.between?(0,7) && y.between?(0,7)
  end
end
