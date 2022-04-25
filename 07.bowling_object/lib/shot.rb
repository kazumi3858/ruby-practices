# frozen_string_literal: true

class Shot
  # def create_shots(numbers)
  #   scores = numbers.gsub('X', '10,NA')
  #   scores.split(',')
  # end
  def initialize(number)
    @number = number
  end

  def score
    @number == "X" ? 10 : @number.to_i
    end
end
