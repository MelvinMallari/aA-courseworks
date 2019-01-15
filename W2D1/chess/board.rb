require 'singleton'
require 'byebug'

class Board
    attr_reader :board

    def initialize
        @board = Array.new(8) { Array.new(8) }
        populate

    end

    def populate
        self.board.each_index do |i|
            self.board[0].each_index do |j|
                if i <= 1 || i >= 6
                    self.board[i][j] = Piece.new("green", self, [i, j])
                else
                    self.board[i][j] = NullPiece.instance
                end
            end
        end
    end

    def move(start_pos, end_pos)
        # check if peice at start_pos, return err if not
        # check end_pos, see if it's free
        # if not, return capture
        # check end_pos to see if actually on the board
        # check if start_pos piece can move to end_pos
        debugger
        begin
            puts "start"
            # if board[start_pos].is_a?(NullPiece)
            #     puts "step"
            #     raise "start_pos is empty"
            #     # retry
            if valid_move?(end_pos) && board[end_pos].is_a?(NullPiece)
                p "end_pos: #{end_pos}"
                p "start_pos: #{start_pos}"
                board[start_pos], board[end_pos] = board[end_pos], board[start_pos]
            else
                raise "Move Invalid, please try again"
                # retry
            end
        # rescue
            # retry
        end
        
    end

    def valid_move?(end_pos)
        puts "valid_move"
        return false if end_pos[0] < 0 || end_pos[0] > 7
        return false if end_pos[1] < 0 || end_pos[1] > 7
        true
    end

    def [](pos)
        row, col = pos
        self.board[row][col]
    end

    def []=(pos, val)
        row, col = pos
        self.board[row][col] = val
    end
end

class Piece
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    private
    def move_into_check?(end_pos)
        # DONT know yet
    end
end

class NullPiece < Piece
    include Singleton
    
    # def initialize(color, board, pos)
    def initialize
        # super(color, board, pos)
    end

    def moves
    end

    def symbol
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

class King < Piece
    def symbol
        "K"
    end

    def move_diffs

    end
end

if __FILE__ == $PROGRAM_NAME
    b = Board.new
    b.move([0,0],[4,0])
    

end