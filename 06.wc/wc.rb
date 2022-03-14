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

  def result(total_line_number = 0, total_word_number = 0, total_size_number = 0)
    input = file_names.empty? == true ? [$stdin.read] : file_names
    input.each do |data|
      text = input == file_names ? File.read(data) : data
      total_line_number += text.count("\n")
      total_word_number += text.split.count
      total_size_number += text.bytesize
      print text.count("\n").to_s.rjust(4)
      print text.split.count.to_s.rjust(5) + text.bytesize.to_s.rjust(5) unless params[:l]
      input == file_names ? puts(" #{data}") : puts("\n")
    end
    return unless file_names.size >= 2

    print total_line_number.to_s.rjust(4)
    print total_word_number.to_s.rjust(5) + total_size_number.to_s.rjust(5) unless params[:l]
    puts ' total'
  end
end

Wc.new.result
