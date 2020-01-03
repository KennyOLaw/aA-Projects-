class Piece

    attr :pos, :color

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
        @board.add_piece(self, pos)
    end
    
    def to_s
       " #{symbol} "
    end

    def empty?
        false 
    end 

    def valid_moves
        moves.reject{|end_pos| move_into_check?(end_pos)}
    end 

    def pos=(val)
        self.pos = val
    end 

    def symbol 

    end 
    
    private

    def move_into_check?(end_pos)
        test_check = board.dup
        test_check.move_piece!(pos, end_pos)
        test_check.in_check?(color)
    end 

end