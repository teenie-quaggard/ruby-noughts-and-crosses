class Board
    attr_reader :tiles
    def initialize(args = {})
        @tiles = args[:tiles] || {
            0 => nil,
            1 => nil,
            2 => nil,
            3 => nil,
            4 => nil,
            5 => nil,
            6 => nil,
            7 => nil,
            8 => nil
        }
    end 

    def self.empty
        Board.new
    end

    def possible_moves
        empty_tiles = {}
        @tiles.each { |key, value| 
          empty_tiles[key] = value if value == nil
        }
        empty_tiles
    end

    def empty?
        @tiles.all? {|key, value| value == nil}
    end

    def make_move(mark, input)
        index = find_index(input)
        @tiles[index] = mark
    end

    def validate(input)
        if spot_taken?(input)
            "Spot taken"
        elsif bad_input?(input)
            "Bad input"
        else
            "Good input"
        end
    end

    def spot_taken?(input)
        index = find_index(input)
        @tiles[index] != nil
    end

    def bad_input?(input)
        int_input = convert_to_int(input)
        int_input == 0 || int_input > @tiles.length
    end

    def tile_content(input)
        index = find_index(input)
        @tiles[index]
    end

    def find_index(input)
        digit = convert_to_int(input)
        index = digit - 1
    end

    def convert_to_int(input)
        input.to_i
    end

end
