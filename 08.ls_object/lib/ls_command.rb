require 'optparse'
require_relative './long_file_list'
require_relative './short_file_list'

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
    list = @option["l"] ? LongFileList.new(sort_files) : ShortFileList.new(sort_files)
    list.format_list
  end
end

p LSCommand.new.show_result

