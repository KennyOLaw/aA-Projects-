require_relative '00_tree_node'

class KnightPathFinder
    
    
    KNIGHT_MOVES = [
        [-2, -1], [-2, 1], [-1, -2], [1, -2], 
        [2, -1], [2, 1], [-1, 2], [1, 2]
    ]

    attr_accessor :considered_positions
    attr_reader :root_node

    def self.valid_moves(pos)
        p1, p2 = pos
        moves = []

        KNIGHT_MOVES.each do |move|
          num1, num2 = move
          c1 = p1 + num1
          c2 = p2 + num2
          moves << [c1, c2] unless (c1 < 0 || c1 > 7) || (c2 < 0 || c2 > 7)
        
        end
        moves
    end

    def initialize(pos)
        @considered_positions = []
        @root_node = PolyTreeNode.new(pos)
        build_move_tree
    end 
    
    def new_moves_positions(pos)
      moves = KnightPathFinder.valid_moves(pos)
      self.considered_positions.each do |move|
        moves.delete(move) if moves.include?(move)
      end
      @considered_positions += moves
      moves
    end 

    def build_move_tree
        queue = [self.root_node]
        until queue.empty?
            checked = queue.shift
            moves = self.new_moves_positions(checked.value)
            moves.map! { |move| PolyTreeNode.new(move) }
            debugger
            moves.each { |node| checked.add_child(node) }
            queue += checked.children
        end
        nil
    end

    def find_path(end_pos)
      self.root_node.dfs(end_pos)
    end

    def trace_path_back
      path = []
      find_path
      path.reverse
    end
end 