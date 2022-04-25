# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :first_shot, :second_shot, :third_shot

  def initialize(first_shot, second_shot, third_shot = nil)
    @first_shot = Shot.new(first_shot).score
    @second_shot = Shot.new(second_shot).score
    @third_shot = Shot.new(third_shot).score
  end

  def score
    [first_shot, second_shot, third_shot].sum
  end
end
