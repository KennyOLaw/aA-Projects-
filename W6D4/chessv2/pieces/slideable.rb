module Slideable
    private 
    HORIZONTAL_DIRS = [
        [1,0], #top
        [0, 1], # right
        [0, -1], # left
        [-1, 0] # down
    ]
    DIAGONAL_DIRS = [
        [1, 1], # top right corner
        [-1, 1], # bottom right corner
        [-1, -1],  # left bottom corner
        [1, -1], # top left corner 
    ]

    public
    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        moves = []
        move_dirs.each do |dx, dy|
            moves.concat(grow_unblocked_moves_in_dir(dx,dy))
        end 
        moves
    end

    private
    def move_dirs
    end

    def grow_unblocked_moves_in_dir(dx,dy)
        moves = []
        row, col = pos
        
        loop do
            pos = [(row + dx), (col + dy)]  
            
            break unless board.valid_pos?(pos)
            if board[pos].empty?
                moves << pos
            else
                moves << pos if board[pos].color != color

                break
            end 
        end
        moves
     end
end  