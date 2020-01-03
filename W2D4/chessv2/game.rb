require_relative "cursor"
require_relative "board"

class Game 

end 

class Display
    attr_accessor :cursor
    attr_reader :board

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], self.board)
    end 

    def render
        self.board.grid.each_with_index do |row, i|
            puts row.map.with_index {|piece, j| 
                sum = i + j
                
                if cursor.cursor_pos == [i,j]
                    tile = piece.to_s.colorize(:background => :yellow)
                else
                    if sum.even? 
                        tile = piece.to_s.colorize(:background => :red)
                    else
                        title = piece.to_s.colorize(:background => :light_blue)
                    end
                end
        }.join(" ")
        end
    end 

end 

if __FILE__ == $PROGRAM_NAME
b = Board.board_setup
d = Display.new(b)
until d.cursor.selected
    system("clear")
    d.render
    d.cursor.get_input
end
end