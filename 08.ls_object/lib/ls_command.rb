# frozen_string_literal: true

require 'optparse'
require_relative 'long_file_list'
require_relative 'short_file_list'

class LSCommand
  def initialize(argv = ARGV)
    @options = argv.getopts('arl')
  end

  def show_list
    file_list = sort_files.map { |file_name| FileData.new(file_name) }
    @options['l'] ? LongFileList.new(file_list).show_list : ShortFileList.new(file_list).show_list
  end

  private

  def find_files
    @options['a'] ? Dir.glob('*', File::FNM_DOTMATCH) : Dir.glob('*')
  end

  def sort_files
    @options['r'] ? find_files.sort.reverse : find_files
  end
end

#puts LSCommand.new(ARGV).show_list
