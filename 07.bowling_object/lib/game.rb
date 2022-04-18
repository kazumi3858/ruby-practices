# frozen_string_literal: true

require_relative 'frame'

class Game
  def show_total_score(numbers)
    total_score = 0
    frames = Frame.new.create_frames(numbers)
    frames.first(9).each_with_index do |frame, index|
      total_score += calculate_first_nine_frames(frames, frame, index)
    end
    total_score += calculate_last_frame(frames)
  end

  def calculate_first_nine_frames(frames, frame, index)
    strike = [10, 0]
    spare = 10
    if frame == strike && frames[index + 1][0..1] == strike
      plus_consecutive_strike_score(frames, index)
    elsif frame == strike
      plus_strike_score(frames, index)
    elsif frame.sum == spare
      plus_spare_score(frames, index)
    else
      frame.sum
    end
  end

  def calculate_last_frame(frames)
    frames[9].sum
  end

  def plus_spare_score(frames, index)
    10 + frames[index + 1][0]
  end

  def plus_consecutive_strike_score(frames, index)
    ninth_frame = index == 8
    ninth_frame ? 20 + frames[index + 1][2] : 20 + frames[index + 2][0]
  end

  def plus_strike_score(frames, index)
    10 + frames[index + 1][0..1].sum
  end
end

p Game.new.show_total_score(ARGV[0])
