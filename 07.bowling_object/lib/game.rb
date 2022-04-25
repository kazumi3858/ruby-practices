# frozen_string_literal: true

require_relative "frame"

class Game
  # def show_total_score(numbers)
  #   total_score = 0
  #   frames = Frame.new.create_frames(numbers)
  #   frames.first(9).each_with_index do |frame, index|
  #     total_score += frame.sum
  #     total_score += bonus_scores(frames, frame, index)
  #   end
  #   total_score += frames[9].sum
  # end

  # def bonus_scores(frames, frame, index)
  #   @next_frame = frames[index + 1]
  #   @after_next_frame = frames[index + 2]
  #   if frame[0] == 10 && @next_frame[0] == 10
  #     consecutive_strike_score(index)
  #   elsif frame[0] == 10
  #     strike_score
  #   elsif frame.sum == 10
  #     spare_score
  #   else
  #     0
  #   end
  # end

  # def spare_score
  #   @next_frame[0]
  # end

  # def consecutive_strike_score(index)
  #   ninth_frame = index == 8
  #   ninth_frame ? 10 + @next_frame[1] : 10 + @after_next_frame[0]
  # end

  # def strike_score
  #   @next_frame[0..1].sum
  # end

  def frames(numbers)
    numbers = numbers.gsub("X", "10,NA").split(",")
    divided_numbers = numbers.first(18).each_slice(2).to_a.push(numbers[18..])
    divided_numbers.map do |shots|
      shots.delete("NA") if shots.include?("NA")
      Frame.new(shots[0], shots[1], shots[2])
    end
  end

  def show_total_score(numbers)
    frames = frames(numbers)
    total_score = 0
    frames.first(9).each_with_index do |frame, index|
      total_score += frame.score
      total_score += bonus_scores(frames, frame, index)
    end
    total_score += frames[9].score
  end

  def bonus_scores(frames, frame, index)
    next_frame = frames[index + 1]
    after_next_frame = frames[index + 2]
    if frame.first_shot == 10 && next_frame.first_shot == 10
      consecutive_strike_score(index, next_frame, after_next_frame)
    elsif frame.first_shot == 10
      strike_score(next_frame)
    elsif frame.score == 10
      spare_score(next_frame)
    else
      0
    end
  end

  def consecutive_strike_score(index, next_frame, after_next_frame)
    ninth_frame = index == 8
    ninth_frame ? 10 + next_frame.second_shot : 10 + after_next_frame.first_shot
  end

  def strike_score(next_frame)
    next_frame.first_shot + next_frame.second_shot
  end

  def spare_score(next_frame)
    next_frame.first_shot
  end
end

puts Game.new.show_total_score(ARGV[0])
