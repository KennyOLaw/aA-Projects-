require_relative 'piece'
class Pawn < Piece
    def symbol
        "♙".colorize(color)
    end

    def moves
        forward_steps + side_attacks
    end 


    private
    def at_start_row?
        row, col = self.pos
        row == 1 || row == 6
    end

    # returns 1 or -1
    def forward_dir
        self.color == :white ? 1 : -1
    end

    def forward_steps
        row, col = pos
        new_pos = [row + forward_dir, col]

        steps = []
        return steps if board.valid_pos?(new_pos) && board[new_pos].empty?

        steps << new_pos
        if at_start_row?
            sec_step = [row + (2* forward_dir), col]
            steps << sec_step if board[sec_step].empty?
        end
        steps
    end

    def side_attacks
        row, col = pos
        possible_attacks = [[row + forward_dir, col - 1], [row + forward_dir, col + 1]]

        possible_attacks.reject do |move| 
            !board.valid_pos?(move) || board[move].color != self.color
        end
    end
end