require_relative 'slideable'
require_relative 'piece'
class Queen < Piece
    include Slideable

    def symbol
        "♛".colorize(color)
    end

    protected
    def move_dirs
        horizontal_dirs + diagonal_dirss
    end
end