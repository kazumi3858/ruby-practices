require "date"
require "optparse"
opt = OptionParser.new

params = {}

opt.on("-y VAL") { |v| params[:y] = v }
opt.on("-m VAL") { |v| params[:m] = v }

opt.parse!(ARGV)

if params[:y] == nil
  a = Date.today.year
else
  a = params[:y].to_i
end
if params[:m] == nil
  b = Date.today.month
else
  b = params[:m].to_i
end

puts Date.new(a, b).strftime("%m月 %Y").center(20)
puts "日 月 火 水 木 金 土"

firstday = Date.new(a, b, 1).strftime("%w")
f = firstday.to_i
f.times do
  print "   "
end

days = (Date.new(a, b, 1)..Date.new(a, b, -1))
days.each do |day|
  a = day.strftime("%e ")
  print a
  if day.wday == 6
    puts "\n"
  end
end

puts "\n"

