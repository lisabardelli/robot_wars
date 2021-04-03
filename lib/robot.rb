require 'set'
require_relative './location'
require_relative './string'
require_relative './arena'

class Robot
  attr_reader :current_location, :current_direction

  def initialize(initial_robot_position, instructions = '', arena)
    @arena = arena
    calculate_initial_position(initial_robot_position)
    calculate_final_position(instructions)
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
    raise 'Invalid location (outside the arena)' unless @arena.is_a_valid_location?(@current_location)

    raise 'Invalid direction' unless is_a_valid_direction?(initial_robot_position_array[2])

    @current_direction = initial_robot_position_array[2].capitalize
  end

  def calculate_final_position(instructions)
    valid_instruction_set = Set['L', 'M', 'R']
    instruction_array = instructions.split('')
    instruction_array.each do |instruction|
      instruction = instruction.capitalize
      raise 'Invalid instruction' unless valid_instruction_set.include?(instruction)

      process_instruction(instruction)
    end
  end

  def process_instruction(instruction)
    case instruction
    when 'M'
      move
    when 'L'
      rotate_left
    when 'R'
      rotate_right
    end
  end

  def rotate_right
    future_directions = {
      'N' => 'E',
      'E' => 'S',
      'S' => 'W',
      'W' => 'N'
    }
    rotate(future_directions)
  end

  def rotate_left
    future_directions = {
      'N' => 'W',
      'E' => 'N',
      'S' => 'E',
      'W' => 'S'
    }

    rotate(future_directions)
  end

  def rotate(future_directions)
    calculated_future_direction = future_directions[@current_direction]
    future_direction = calculated_future_direction
    @current_direction = future_direction
  end

  def move
    case @current_direction
    when 'N'
      future_location = increase_y
    when 'E'
      future_location = increase_x
    when 'S'
      begin
        future_location = decrease_y
      rescue StandardError
        puts 'The robot did not move because next to the bottom border'
        return
      end
    when 'W'
      begin
        future_location = decrease_x
      rescue StandardError
        puts 'The robot did not move because next to the left border'
        return
      end
    end

    if @arena.is_a_valid_location?(future_location)
      @current_location = future_location
    else
      puts 'The robot did not move'
    end
  end

  def increase_y
    future_location = Location.new(@current_location.x, @current_location.y + 1)
  end

  def increase_x
    future_location = Location.new(@current_location.x + 1, @current_location.y)
  end

  def decrease_y
    future_location = Location.new(@current_location.x, @current_location.y - 1)
  end

  def decrease_x
    future_location = Location.new(@current_location.x - 1, @current_location.y)
  end
end
