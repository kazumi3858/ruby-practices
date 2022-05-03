# frozen_string_literal: true

require 'optparse'
require_relative 'long_file_list'
require_relative 'short_file_list'

option = ARGV.getopts('arl')
file_names = option['a'] ? Dir.glob('*', File::FNM_DOTMATCH) : Dir.glob('*')
file_names = option['r'] ? file_names.sort.reverse : file_names
puts option['l'] ? LongFileList.new(file_names).show_list : ShortFileList.new(file_names).show_list
