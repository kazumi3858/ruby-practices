# frozen_string_literal: true

require "optparse"
require_relative "long_file_list"
require_relative "short_file_list"

class LSCommand
  def initialize
    @option = ARGV.getopts("arl")
  end

  def find_files
    @option["a"] ? Dir.glob("*", File::FNM_DOTMATCH) : Dir.glob("*")
  end

  def sort_files
    @option["r"] ? find_files.sort.reverse : find_files
  end

  def show_result
    @option["l"] ? LongFileList.new(sort_files).show_list : ShortFileList.new(sort_files).show_list
  end
end

puts LSCommand.new.show_result
