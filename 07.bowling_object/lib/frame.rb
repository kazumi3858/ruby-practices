# frozen_string_literal: true

require_relative 'shot'

class Frame
  def divide_shots(numbers)
    shots = Shot.new.create_shots(numbers)
    first_nine_frames = shots.first(18).each_slice(2).to_a
    first_nine_frames.push(shots[18..])
  end

  def create_frames(numbers)
    frames = divide_shots(numbers)
    frames.map do |frame|
      frame.delete('NA') if frame.include?('NA')
      frame.map(&:to_i)
    end
  end
end
