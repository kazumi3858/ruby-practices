# frozen_string_literal: true

require_relative "shot"

class Frame < Shot
  def create_frames(numbers)
    shots = create_shots(numbers)
    first_nine_frames = shots.first(18).each_slice(2).to_a
    first_nine_frames.push(shots[18..])
  end
end

#Frame.new.create_frames(ARGV[0])
