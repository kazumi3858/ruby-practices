# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :first_shot, :second_shot, :third_shot

  def initialize(first_shot, second_shot, third_shot = nil)
    @first_shot = Shot.new(first_shot)
    @second_shot = Shot.new(second_shot)
    @third_shot = Shot.new(third_shot)
  end

  def self.frames(numbers)
    numbers = numbers.split(',')
    revised_numbers = []
    numbers.each do |number|
      revised_numbers << number
      revised_numbers << nil if number == 'X'
    end
    groups_of_numbers = revised_numbers.first(18).each_slice(2).to_a.push(revised_numbers[18..]).map(&:compact)
    groups_of_numbers.map { |group| Frame.new(group[0], group[1], group[2]) }
  end

  def score
    [first_shot.score, second_shot.score, third_shot.score].sum
  end

  def strike?
    first_shot.score == 10
  end

  def spare?
    return false if strike?
    first_shot.score + second_shot.score == 10
  end
end
