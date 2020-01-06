require_relative 'pieces'
require_relative 'cursor'
require_relative 'pieces/king'

class Board

    attr_reader :grid
    
    def self.board_setup
        board = Board.new
        board.grid.each_with_index do |row, row_i|
            row.each_with_index do |tile, tile_i|
                pos = [row_i, tile_i]
                if row_i.between?(0, 1)
                    row_i == 0 ? board.backpiece(:white, pos) : board.board_pawn(:white, pos)
                elsif row_i.between?(6, 7)
                    row_i == 7 ? board.backpiece(:black, pos) : board.board_pawn(:black, pos)
                end 
            end 
        end 
        board
    end 

    def initialize
        @grid = Array.new(8) { Array.new(8, NullPiece.instance)}
        @sentinel = nil
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end 

    def backpiece(color, pos)
        _, col = pos

        case col
        when 0, 7
            Rook.new(color, self, pos)
        when 1, 6
            Knight.new(color,self, pos)
        when 2, 5 
            Bishop.new(color, self, pos)
        when 3
            Queen.new(color, self, pos)
        when 4 
            King.new(color, self, pos)
        end
    end

    def board_pawn(color, pos)
        Pawn.new(color, self, pos)
    end

    def [](pos)
        row, col = pos
        self.grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        self.grid[row][col] = value
    end

    def move_piece(start_pos, end_pos)
        raise "no piece selected" if self[start_pos] == nil
        piece = self[start_pos]
        #check later to see if end_pos is valid
        self[start_pos] = nil
        self[end_pos] = piece
    end

    def valid_pos?(pos)
        row, col = pos

        row.between?(0,7) && col.between?(0,7)
    end

    def checkmate?(color)

    end 

    def in_check?(color)
        king_pos = find.king(color).pos
        pieces.each do |piece|
            return true if piece.moves.include?(king_pos)
        end
        false
    end 

    def find_king(color)
        pieces.each do |piece|
            return piece if piece.is_a?(King) && piece.color == color
        end 
        nil
    end 
    
    def pieces 
        board.grid.flatten.reject(&:empty?)
    end

    def dup
        self.board.dup
    end 

end

if __FILE__ == $PROGRAM_NAME
b = Board.board_setup
b.move_piece([0,0], [1,0])
b[[1,0]].to_s
b[[7,0]].to_s
end