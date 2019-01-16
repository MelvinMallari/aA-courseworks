require_relative "board"
require_relative "cursor"
require 'colorize'
# require 'colorized_string'

class Display
    attr_reader :board, :cursor

    def initialize
        @board = Board.new
        @cursor = Cursor.new([0,0], self.board)
        render
    end
    


    def render
        # i = 0
        self.board.board.each_with_index do |row, i|
            # print i.to_s + ':' 
            # i += 1
            row.each_with_index do |col, j|
                if [@cursor.cursor_pos[0], @cursor.cursor_pos[1]] == [i, j]
                    print board[[i, j]].to_s.colorize(:background => :blue)
                elsif (i.odd? && j.odd?) || (i.even? && j.even?)
                    print board[[i, j]].to_s.colorize(:color => board[[i,j]].color, :background => :black)
                else
                    print board[[i, j]].to_s.colorize(:color => board[[i,j]].color, :background => :red)
                # print "[ ]".colorize(:color => :light_blue, :background => :blue )
                end
            end
            puts ''
        end
        print "\n"
        # @board[@cursor.cursor_pos].symbol.colorize(:background => :blue)
    end

    def test 
        while true
            system('clear')
            render
            @cursor.get_input
        end
    end

    def inspect
    end
end
