# frozen_string_literal: true

require 'optparse'
require_relative 'long_file_list'
require_relative 'short_file_list'

class LSCommand
  def initialize
    @options = ARGV.getopts('arl')
  end

  def find_files(option = @options['a'])
    option ? Dir.glob('*', File::FNM_DOTMATCH) : Dir.glob('*')
  end

  def sort_files(option = @options['r'])
    option ? find_files.sort.reverse : find_files
  end

  def show_list(option = @options['l'])
    option ? LongFileList.new(sort_files).show_list : ShortFileList.new(sort_files).show_list
  end
end

puts LSCommand.new.show_list
