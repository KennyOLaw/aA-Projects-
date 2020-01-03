require_relative 'stepable'
require_relative 'piece'
class Knight < Piece
    include Stepable

    def symbol
        "♞".colorize(color)
    end

    protected
    def move_diffs
        moves = [
            [2, 1],
            [1, 2],
            [-1, 2],
            [-2, 1],
            [-1, -2],
            [-2, -1],
            [1, -2],
            [2, -1],
        ]
    end
end