# frozen_string_literal: true

class Shot
  def create_shots(numbers)
    scores = numbers.gsub('X', '10,0')
    scores.split(',').map(&:to_i)
  end
end

# Shot.new.get_scores(ARGV[0])
