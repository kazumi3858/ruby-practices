# frozen_string_literal: true

require 'optparse'

TEXT_WIDTH = 30
COLUMNS = 3

def options
  @options ||= ARGV.getopts('arl') # 受け取れるオプション
end

def file_lists
  Dir.glob('*').map { |list| list.ljust(TEXT_WIDTH) }
end

def reverse_lists_option
  options['r'] ? file_lists.sort.reverse : file_lists
end

def create_columns
  lists = reverse_lists_option
  rest_of_row = lists.size % COLUMNS
  (COLUMNS - rest_of_row).times { lists.push(nil) } if rest_of_row != 0
  lists.each_slice(lists.size / COLUMNS).to_a
end

def show_results
  create_columns.transpose.each do |result|
    puts result.join
  end
end

show_results
