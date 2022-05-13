# frozen_string_literal: true

require 'optparse'
require_relative 'file_data'
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
    files = find_files
    file_data_list = sort_files(files).map { |file| FileData.new(file) }
    @options[:l] ? LongFileList.new(file_data_list).show_list : ShortFileList.new(file_data_list).show_list
  end

  private

  def find_files
    @options[:a] ? Dir.glob('*', File::FNM_DOTMATCH) : Dir.glob('*')
  end

  def sort_files(files)
    @options[:r] ? files.sort.reverse : files
  end
end

puts LSCommand.new(ARGV).show_list
