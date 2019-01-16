require_relative 'piece'
require_relative 'stepable'


class King < Piece
    attr_reader :symbol
    include SteppingPiece

    def symbol
        " K "
    end

    def move_diffs
        king_dirs
    end

    def move_dirs
        king_dirs
    end
end