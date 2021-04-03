class String
  def is_a_non_negative_integer?
    if /\A\d+\z/.match(self)
      true
    else
      false
    end
  end
end
