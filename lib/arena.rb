require_relative "./location"
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
      x = input_array[0]
      y = input_array[1]
      @top_right_corner = Location.new(x.to_i, y.to_i) 
  end


end
