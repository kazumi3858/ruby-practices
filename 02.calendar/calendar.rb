require "date"
require "optparse"
opt = OptionParser.new

params = {}

opt.on("-y VAL") { |v| params[:y] = v }
opt.on("-m VAL") { |v| params[:m] = v }

opt.parse!(ARGV)

year = params[:y]&.to_i || Date.today.year
month = params[:m]&.to_i || Date.today.month

puts Date.new(year, month).strftime("%m月 %Y").center(20)
puts "日 月 火 水 木 金 土"

firstday = Date.new(year, month, 1).strftime("%w")
fday = firstday.to_i
fday.times do
  print "   "
end

days = (Date.new(year, month, 1)..Date.new(year, month, -1))
days.each do |day|
  all_days = day.strftime("%e ")
  print all_days
  if day.wday == 6
    puts "\n"
  end
end

puts "\n"
