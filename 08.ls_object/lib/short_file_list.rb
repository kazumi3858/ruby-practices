# frozen_string_literal: true

class ShortFileList
  COLUMNS = 3
  TEXT_WIDTH = 20

  def initialize(file_data_list)
    @file_data_list = file_data_list
  end

  def show_list
    formated_file_data_list = @file_data_list.map { |file_data| file_data.name.ljust(TEXT_WIDTH) }
    rest_of_row = formated_file_data_list.size % COLUMNS
    (COLUMNS - rest_of_row).times { formated_file_data_list.push(nil) } unless rest_of_row.zero?
    columns = formated_file_data_list.each_slice(formated_file_data_list.size / COLUMNS).to_a
    columns.transpose.map { |column| column.join.strip }
  end
end
