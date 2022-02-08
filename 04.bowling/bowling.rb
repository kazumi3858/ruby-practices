# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
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
  a = i + 1
  b = i + 2
  point += if frames[i] == [10, 0] && frames[a] == [10, 0]
             10 + 10 + frames[b].first
           elsif frames[i] == [10, 0]
             10 + frames[a].sum
           elsif frame.sum == 10
             10 + frames[a].first
           else
             frame.sum
           end
end

point += frames[9].sum unless frames[9].nil?
point += frames[10].sum unless frames[10].nil?
point += frames[11].sum unless frames[11].nil?

puts point
