require 'byebug'

module SteppingPiece
    KNIGHT_DIRECTIONS = [
        [1, 2],
        [-1, 2],
        [1, -2],
        [-1, -2],
        [2, 1],
        [-2, 1],
        [2, -1],
        [-2, -1]
    ]

    KING_DIRECTIONALS = [
        [1, 0],
        [-1, 0],
        [0, 1],
        [0, -1],
        [-1, 1],
        [1, -1],
        [-1, -1],
        [1, 1]
    ]


    def move_diffs
        #to be overwritten by subclass

    end

    def moves
        # debugger
        potential_moves = []
        move_diffs.each do |dx, dy|
            current_pos = @pos
            current_potential = [current_pos[0] + dx, current_pos[1] + dy]
            if self.board[current_potential].is_a?(NullPiece)
                potential_moves << current_potential
            end
            # Eventually need to check if piece owned by opposing player
        end
        potential_moves
    end

    def move_dirs

    end

    def knight_dirs
        KNIGHT_DIRECTIONS
    end

    def king_dirs
        KING_DIRECTIONALS
    end

end
