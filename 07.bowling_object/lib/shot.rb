# frozen_string_literal: true

class Shot
  def create_shots(numbers)
    scores = numbers.gsub('X', '10,NA')
    scores.split(',')
  end
end
