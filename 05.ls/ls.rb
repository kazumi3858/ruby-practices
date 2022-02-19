# frozen_string_literal: true

def file_lists
  Dir.glob('*').map do |list|
    list.ljust(30)
  end
end

def create_columns
  columns = 3
  case file_lists.size % columns
  when 0
    file_lists.each_slice(file_lists.size / columns).to_a
  when 1
    file_lists.push(nil, nil).each_slice((file_lists.size + 2) / columns).to_a
  when 2
    file_lists.push(nil).each_slice((file_lists.size + 1) / columns).to_a
  end
end

def show_results
  create_columns.transpose.each do |result|
    print result.join
    puts "\n"
  end
end

show_results
