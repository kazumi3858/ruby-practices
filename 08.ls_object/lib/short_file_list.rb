# frozen_string_literal: true

require_relative "file"

class ShortFileList
  COLUMNS = 3
  TEXT_WIDTH = 20

  def initialize(file_list)
    @file_list = file_list.map { |file| FileData.new(file) }
  end

  def create_columns
    file_list = @file_list.map { |file| file.name.ljust(TEXT_WIDTH) }
    rest_of_row = file_list.size % COLUMNS
    (COLUMNS - rest_of_row).times { file_list.push(nil) } unless rest_of_row.zero?
    file_list.each_slice(file_list.size / COLUMNS).to_a
  end

  def show_result
    create_columns.transpose.each do |result|
      print result.join
      puts "\n"
    end
  end
end

#ShortFileList.new(["test", "lib", ".gitkeep", "..", "."]).show_result
