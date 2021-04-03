class String
  def is_a_positive_integer?
    /\A\d+\z/.match(self)
  end
end
