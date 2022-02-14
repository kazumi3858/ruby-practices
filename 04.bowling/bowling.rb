# frozen_string_literal: true

scores = ARGV[0].split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  frames << s
end

point = 0
frames.first(9).each_with_index do |frame, i|
  next1 = i + 1
  next2 = i + 2
  point += if frames[i] == [10, 0] && frames[next1] == [10, 0]
             10 + 10 + frames[next2].first
           elsif frames[i] == [10, 0]
             10 + frames[next1].sum
           elsif frame.sum == 10
             10 + frames[next1].first
           else
             frame.sum
           end
end

point += frames[9].sum unless frames[9].nil?
point += frames[10].sum unless frames[10].nil?
point += frames[11].sum unless frames[11].nil?

puts point
