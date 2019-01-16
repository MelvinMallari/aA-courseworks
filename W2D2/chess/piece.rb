require_relative 'king'
require_relative 'knight'

class Piece
    attr_reader :symbol, :color, :board
    attr_accessor :pos

    def initialize(color = :blue, board, pos)
        @color = color.to_sym
        @board = board
        @pos = pos
    end

    def symbol
        " P "
    end

    def to_s
        self.symbol.to_s
    end


    def move(end_pos)
    end

    private
    def move_into_check?(end_pos)
        # DONT know yet
    end

end

class NullPiece < Piece
    include Singleton
    attr_reader :symbol
    
    def initialize
    end

    def moves
    end

    def symbol
        "   "
    end
end

class Pawn < Piece
    def symbol
        puts "P"
    end

    def move_dirs
        # Don't know yet lol
    end
end




if __FILE__ == $PROGRAM_NAME
    load 'board.rb'
    load 'piece.rb'
    load 'display.rb'
    load 'slideable.rb'
    load 'cursor.rb'
    load 'king.rb'
    load 'board.rb'

    a = Display.new
    a.render
    a.board.move([0,4],[2,4])
    a.board[[2,4]].moves

end