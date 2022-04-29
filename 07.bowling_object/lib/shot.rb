# frozen_string_literal: true

class Shot
  def initialize(number)
    @number = number
  end

  def score
    @number == 'X' ? 10 : @number.to_i
  end
end
