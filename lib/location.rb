class Location
  attr_reader :x, :y

  def initialize(x, y)
    check_value(x)
    @x = x
    check_value(y)
    @y = y
  end

  def check_value(value)
    raise 'Negative value' if value < 0
  end
end
