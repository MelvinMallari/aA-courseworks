require 'singleton'
require 'byebug'
require_relative 'piece'

class Board
    attr_reader :board

    def initialize
        @board = Array.new(8) { Array.new(8) }
        populate
    end

    def [](pos)
        row, col = pos
        self.board[row][col]
    end

    def []=(pos, val)
        row, col = pos
        self.board[row][col] = val
    end

    def populate
        rook = [[0,0],[0,7],[7,0],[7,7]]
        knight = [[0,1],[0,6],[7,1],[7,6]]
        bishop = [[0,2],[0,5],[7,2],[7,5]]
        king = [[0,4],[7,4]]
        queen = [[0,3],[7,3]]
        # pawns = row == 1 || row == 6
        self.board.each_index do |i|
            self.board[0].each_index do |j|
                # debugger
                if king.include?([i,j])
                    self.board[i][j] = King.new(:white, self, [i, j])
                elsif knight.include?([i,j])
                    self.board[i][j] = Knight.new(:white, self, [i, j])
                elsif i <= 1 || i >= 6
                    self.board[i][j] = Piece.new(:green, self, [i, j])
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
        # debugger
        
        if self[start_pos].is_a?(NullPiece)
            raise "Invalid Start Position"
        elsif valid_move?(end_pos) && self[end_pos].is_a?(NullPiece)
            self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
            self[end_pos].pos = end_pos
        else
            raise "Move Invalid, please try again"
        end
    end

    def valid_move?(end_pos)
        return false if end_pos[0] < 0 || end_pos[0] > 7
        return false if end_pos[1] < 0 || end_pos[1] > 7
        true
    end

    def valid_pos?(end_pos)
        return false if end_pos[0] < 0 || end_pos[0] > 7
        return false if end_pos[1] < 0 || end_pos[1] > 7
        true
    end

    def inspect
    end
end



if __FILE__ == $PROGRAM_NAME
    b = Board.new
    b.move([0,0],[4,0])

end

