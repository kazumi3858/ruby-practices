# frozen_string_literal: true

require 'optparse'
require_relative 'long_file_list'
require_relative 'short_file_list'

class LSCommand
  def initialize(argv = ARGV)
    opts = OptionParser.new
    @options = {}
    opts.on('-a') { |_v| @options[:a] = true }
    opts.on('-r') { |_v| @options[:r] = true }
    opts.on('-l') { |_v| @options[:l] = true }
    opts.parse!(argv)
  end

  def show_list
    file_data_list = sort_files.map { |file_data| FileData.new(file_data) }
    @options[:l] ? LongFileList.new(file_data_list).show_list : ShortFileList.new(file_data_list).show_list
  end

  private

  def find_files
    @options[:a] ? Dir.glob('*', File::FNM_DOTMATCH) : Dir.glob('*')
  end

  def sort_files
    @options[:r] ? find_files.sort.reverse : find_files
  end
end

puts LSCommand.new(ARGV).show_list
