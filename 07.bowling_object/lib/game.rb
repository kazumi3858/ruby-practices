# frozen_string_literal: true

require_relative 'frame'

class Game < Frame
  def show_total_score(numbers)
    final_score = 0
    frames = create_frames(numbers)
    frames.first(9).each_with_index do |frame, i|
      final_score += if frame == [10, 0] && frames[i + 1][0..1] == [10, 0]
                       plus_consecutive_strike_score(frames, i)
                     elsif frame == [10, 0]
                       plus_strike_score(frames, i)
                     elsif frame.sum == 10
                       plus_spare_score(frames, i)
                     else
                       frame.sum
                     end
    end
    final_score += frames[9].sum
  end

  def calculate_first_nine_frames
  end

  def calculate_last_frame
  end

  def plus_spare_score(frames, i)
    10 + frames[i + 1].first
  end

  def plus_consecutive_strike_score(frames, i)
    i == 8 ? 20 + frames[i + 1][2] : 20 + frames[i + 2].first
  end

  def plus_strike_score(frames, i)
    10 + frames[i + 1][0..1].sum
  end
end

p Game.new.show_total_score(ARGV[0])
