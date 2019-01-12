require_relative "./skeleton/lib/00_tree_node"

class KnightPathFinder

    def self.valid_moves(pos)
        x, y = pos[0], pos[1]
        possible_moves = []
        possible_routes = [[-1,-2],[1,-2],[-1,2],[1,2],[2,1],[-2,1],[2,-1],[-2, -1]]
        possible_routes.each do |route|
            dx, dy = route[0], route[1]
            if (x + dx >= 0 && x + dx <= 7) && (y + dy >= 0 && y + dy <= 7)
                possible_moves << [(x + dx), (y + dy)]
            end
        end
        possible_moves
    end

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        # @move_tree = self.build_move_tree(@root_node)
    end

    def new_move_positions(pos)
        @considered_positions << (self.class.valid_moves(pos)- @considered_positions)
    end

    def find_path
        # (run new move positions on 0,0)
        # => add 1,2 and 2,1 to considerd positions
        # => 1,2 and 2,1
        # run new move positons on 1,2
        # run new move positions on 2,1
    end
end