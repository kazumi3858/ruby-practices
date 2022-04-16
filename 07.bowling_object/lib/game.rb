# frozen_string_literal: true

require_relative "frame"

class Game < Frame
  def calculate_scores(numbers)
    total_score = 0
    frames = create_frames(numbers)
    frames.each_with_index do |frame, i|
      one_frame = frames[i]
      next_frame = frames[i + 1]
      after_next_frame = frames[i + 2]
      total_score += if 
    end
  end

  def plus_spare_score
      10 + next_frame.first
  end

  def plus_consecutive_strike_scores
    10 + 10 + after_next_frame.first
  end

  def plus_strike_score
    10 + next_frame.sum
  end
end

p Game.new.calculate_scores(ARGV[0])
