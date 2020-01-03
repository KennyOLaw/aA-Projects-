require_relative 'stepable'
require_relative 'piece'

class King < Piece
    include Stepable

    def symbol
        "♚".colorize(color)
    end

    protected
    def move_diffs
        moves = [
            [1,0], #top
            [0, 1], # right
            [0, -1], # left
            [-1, 0], # down

            [1, 1], # top right corner
            [-1, 1], # bottom right corner
            [-1, -1],  # left bottom corner
            [1, -1], # top left corner 
        ]
    end
end