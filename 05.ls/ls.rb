# frozen_string_literal: true

require 'optparse'

TEXT_WIDTH = 30
COLUMNS = 3
OPTIONS = ARGV.getopts('arl:') # 受け取れるオプション

def file_lists
  if OPTIONS['a']
    Dir.glob('*', File::FNM_DOTMATCH).map { |list| list.ljust(TEXT_WIDTH) }
  else
    Dir.glob('*').map { |list| list.ljust(TEXT_WIDTH) }
  end
end

def create_columns
  lists = file_lists
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
