require_relative './location'
require_relative './string'
class Arena
  attr_reader :top_right_corner

  def initialize(top_right_corner)
    @top_right_corner = top_right_corner
    populate_top_right_corner(@top_right_corner)
  end

  def is_input_a_string?(input)
    raise 'Arena input must be a string' unless input.is_a? String

    true
  end

  def populate_top_right_corner(input)
    input_array = input.split(' ')

    raise 'Too few arguments for Arena' if input_array.length < 2

    begin
      x = input_array[0]
      y = input_array[1]
      raise 'Invalid value' unless x.is_a_positive_integer?
      raise 'Invalid value' unless y.is_a_positive_integer?

      @top_right_corner = Location.new(x.to_i, y.to_i)
    rescue StandardError => e
      puts e
      raise 'Invalid location'
    end
  end
end
