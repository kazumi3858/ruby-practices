# frozen_string_literal: true

require 'optparse'

class Wc
  attr_reader :params, :file_names

  def initialize
    opt = OptionParser.new
    @params = {}
    opt.on('-l') { |v| @params[:l] = v }
    @file_names = opt.parse!(ARGV)
  end

  def result_from_input
    input = $stdin.read
    if params[:l]
      puts input.count("\n")
    else
      puts input.count("\n").to_s.rjust(7) + input.split.count.to_s.rjust(8) + input.bytesize.to_s.rjust(8)
    end
  end

  def result_from_file_names
    file_names.each do |name|
      print File.read(name).count("\n").to_s.rjust(4)
      print File.read(name).split.count.to_s.rjust(5) + File.read(name).bytesize.to_s.rjust(5) unless params[:l]
      puts " #{name}"
    end
  end

  def total_numbers(total_line_number = 0, total_word_number = 0, total_size_number = 0)
    file_names.each do |name|
      total_line_number += File.read(name).count("\n")
      total_word_number += File.read(name).split.count
      total_size_number += File.read(name).bytesize
    end
    print total_line_number.to_s.rjust(4)
    print total_word_number.to_s.rjust(5) + total_size_number.to_s.rjust(5) unless params[:l]
    puts ' total'
  end

  def result
    if file_names.empty?
      result_from_input
    else
      result_from_file_names
      total_numbers if file_names.size >= 2
    end
  end
end

Wc.new.result
