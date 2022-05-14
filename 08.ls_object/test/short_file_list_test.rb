# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/file_data'
require_relative '../lib/short_file_list'

class ShortFileListTest < Minitest::Test
  def test_short_file_list_when_it_has_3_columns
    expected = <<~TEXT.chomp
      test                .gitkeep            .
      lib                 ..                  test
      .gitkeep            .
      ..                  test
    TEXT
    files = ['test', 'lib', '.gitkeep', '..', '.gitkeep', '..', '.', 'test', '.', 'test']
    file_data_list = files.map { |file| FileData.new(file) }
    assert_equal expected, ShortFileList.new(file_data_list).show_list.join("\n")
  end

  def test_short_file_list_when_it_has_less_than_3_columns
    expected = <<~TEXT.chomp
      test                .gitkeep
      lib                 .
    TEXT
    file_data_list = ['test', 'lib', '.gitkeep', '.'].map { |file| FileData.new(file) }
    assert_equal expected, ShortFileList.new(file_data_list).show_list.join("\n")
  end
end
