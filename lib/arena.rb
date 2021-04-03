class Arena
    attr_reader :top_right_corner

    def initialize(top_right_corner)
        @top_right_corner = top_right_corner
    end 

    def is_input_a_string(input)
        raise 'Arena input must be a string' if !input.is_a? String
    
        true
      end
    
end 