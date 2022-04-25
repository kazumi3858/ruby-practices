# frozen_string_literal: true

require_relative "shot"

class Frame
  attr_reader :first_shot, :second_shot, :third_shot
  # def divide_shots(numbers)
  #   shots = Shot.new.create_shots(numbers)
  #   first_nine_frames = shots.first(18).each_slice(2).to_a
  #   first_nine_frames.push(shots[18..])
  # end
  # def create_frames(numbers)
  #   numbers = numbers.gsub('X', '10,NA').split(',')
  #   divided_numbers = numbers.first(18).each_slice(2).to_a.push(numbers[18..])
  #   divided_numbers.map do |shots|
  #     Frame.new(shots)
  #   end
  # end

  # def create_frames(numbers)
  #   frames = divide_shots(numbers)
  #   frames.map do |frame|
  #     frame.delete('NA') if frame.include?('NA')
  #     frame.map(&:to_i)
  #   end
  # end

  def initialize(first_shot, second_shot, third_shot = nil)
    @first_shot = Shot.new(first_shot).score
    @second_shot = Shot.new(second_shot).score
    @third_shot = Shot.new(third_shot).score
  end

  def score
    [first_shot, second_shot, third_shot].sum
  end
end
