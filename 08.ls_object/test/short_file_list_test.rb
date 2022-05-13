# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/file_data'
require_relative '../lib/short_file_list'

class ShortFileListTest < Minitest::Test
  def test_short_file_list1
    expected = <<~TEXT.chomp
      test                .gitkeep            .
      lib                 ..                  test
      .gitkeep            .
      ..                  test
    TEXT
    files = ['test', 'lib', '.gitkeep', '..', '.gitkeep', '..', '.', 'test', '.', 'test']
    file_data_list1 = files.map { |file| FileData.new(file) }
    assert_equal expected, ShortFileList.new(file_data_list1).show_list.join("\n")
  end

  def test_long_file_list2
    expected = <<~TEXT.chomp
      test                .gitkeep
      lib                 .
    TEXT
    file_data_list2 = ['test', 'lib', '.gitkeep', '.'].map { |file| FileData.new(file) }
    assert_equal expected, ShortFileList.new(file_data_list2).show_list.join("\n")
  end
end
