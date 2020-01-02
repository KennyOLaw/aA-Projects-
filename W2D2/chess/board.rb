require_relative 'pieces'

class Board

    attr_reader :grid
    
    def self.board_setup
        board = Board.new
        board.grid.each_with_index do |row, row_i|
            row.each_with_index do |tile, tile_i|
                pos = [row_i, tile_i]
                if row_i.between?(0, 1)
                    if row_i == 0
                        board[pos] = board.backpiece(:white, pos)
                    else
                        board[pos] = board.board_pawn(:white, pos)
                    end
                elsif row_i.between?(6, 7)
                    if row_i == 7
                        board[pos] = board.backpiece(:black, pos)
                    else
                        board[pos] = board.board_pawn(:black, pos)
                    end
                end 
            end 
        end 
        board
    end 

    def initialize
        @grid = Array.new(8) { Array.new(8, nil)}
        @sentienl = NullPiece.new
    end

    def backpiece(color, pos)
        _, col = pos

        case col
        when 0 || 7
            Rook.new(color, self, pos)
        when 1 || 6
            Knight.new(color,self, pos)
        when 2 || 5 
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
end

b = Board.board_setup
p b
p b[[0,0]]
p b[[1,0]]
b.move_piece([0,0], [1,0])
p b[[0,0]]
p b[[1,0]]
p b