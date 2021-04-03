require 'set'
require_relative './location.rb'
require_relative './string.rb'
require_relative './arena.rb'

class Robot
    attr_reader :current_location, :current_direction

    def initialize(initial_robot_position, instructions="", arena)
        @arena = arena
        calculate_initial_position(initial_robot_position)
    end


    private
    def is_a_valid_direction?(direction)
        valid_directions = Set['N', 'E', 'S', 'W']
        valid_directions.include?(direction.capitalize)
    end

    def calculate_initial_position(initial_robot_position)
        initial_robot_position_array = initial_robot_position.split(' ')

        x = initial_robot_position_array[0]
        y = initial_robot_position_array[1]
        raise 'Invalid value' unless x.is_a_non_negative_integer?
        raise 'Invalid value' unless y.is_a_non_negative_integer?
        @current_location = Location.new(x.to_i, y.to_i)
        raise 'Invalid location (outside the arena)' if !@arena.is_a_valid_location?(@current_location)

        raise 'Invalid direction' unless is_a_valid_direction?(initial_robot_position_array[2])
        @current_direction = initial_robot_position_array[2].capitalize
    end

end 