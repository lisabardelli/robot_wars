require_relative './location'
require_relative './string'
class Arena
  attr_reader :top_right_corner, :bottom_left_corner

  def initialize(top_right_corner, occupied_locations = Array.new)
    @occupied_locations = occupied_locations
    @top_right_corner = validate_input(top_right_corner)
    @bottom_left_corner = Location.new(0, 0)
  end

  def is_a_valid_location?(location)
    if location.x > top_right_corner.x
      false
    elsif location.y > top_right_corner.y
      false
    elsif is_an_occupied_location?(location)
      false
    else
      true
    end
end

  def add_occupied_location(current_position)
    if is_a_valid_location?(current_position)
      @occupied_locations << current_position
    else
      raise 'Invalid location'
    end
  end

  def delete_occupied_location(current_position)
    @occupied_locations.delete(current_position)
  end

  private

  def is_input_a_string?(input)
    raise 'Arena input must be a string' unless input.is_a? String

    true
  end

  def validate_input(input)
    populate_top_right_corner(input) if is_input_a_string?(input)
  end

  def populate_top_right_corner(input)
    input_array = input.split(' ')

    raise 'Too few arguments for Arena' if input_array.length < 2

    begin
      x = input_array[0]
      y = input_array[1]
      raise 'Invalid value' unless x.is_a_non_negative_integer?
      raise 'Invalid value' unless y.is_a_non_negative_integer?

      @top_right_corner = Location.new(x.to_i, y.to_i)
    rescue StandardError => e
      puts e
      raise 'Invalid location'
    end
  end

  def is_an_occupied_location?(location)
    @occupied_locations.each do |occupied_location|
        if (occupied_location.x == location.x) && (occupied_location.y == location.y)
          return true
        end
    end
    false
  end
end
