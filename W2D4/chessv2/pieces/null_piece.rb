require_relative "piece"
require "singleton"
class NullPiece < Piece
    include Singleton

    def initialize
        @symbol = " "
        @color = nil
    end 

    def moves
        []
    end
    
    def empty?
        true 
    end 

    def symbol
        " "
    end
end 