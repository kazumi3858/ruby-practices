# frozen_string_literal: true

TEXT_WIDTH = 30

def file_lists
  Dir.glob('*').map do |list|
    list.ljust(TEXT_WIDTH)
  end
end

def create_columns
  lists = file_lists
  columns = 3
  rest_of_row = lists.size % columns
  (columns - rest_of_row).times { lists.push(nil) } if rest_of_row != 0
  lists.each_slice(lists.size / columns).to_a
end

def show_results
  create_columns.transpose.each do |result|
    print result.join
    puts "\n"
  end
end

show_results
