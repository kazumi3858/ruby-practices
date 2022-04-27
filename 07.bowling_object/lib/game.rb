# frozen_string_literal: true

require_relative 'frame'

class Game
  def initialize(numbers)
    @frames = Frame.frames(numbers)
  end

  def show_total_score
    total_score = 0
    @frames.first(9).each_with_index do |frame, index|
      total_score += frame.score
      total_score += bonus_scores(frame, index)
    end
    total_score += @frames[9].score
  end

  def bonus_scores(frame, index)
    next_frame = @frames[index + 1]
    after_next_frame = @frames[index + 2]
    if frame.strike && next_frame.strike
      consecutive_strike_score(index, next_frame, after_next_frame)
    elsif frame.strike
      strike_score(next_frame)
    elsif frame.spare
      spare_score(next_frame)
    else
      0
    end
  end

  def consecutive_strike_score(index, next_frame, after_next_frame)
    10 + (index == 8 ? next_frame.second_shot.score : after_next_frame.first_shot.score)
  end

  def strike_score(next_frame)
    next_frame.first_shot.score + next_frame.second_shot.score
  end

  def spare_score(next_frame)
    next_frame.first_shot.score
  end
end

game = Game.new(ARGV[0])
puts game.show_total_score
