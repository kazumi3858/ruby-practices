# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/file_data'
require_relative '../lib/long_file_list'

class LongFileListTest < Minitest::Test
  def test_long_file_list
    expected = <<~TEXT.chomp
      total 16
      drwxr-xr-x  4 kazumi kazumi 4096 May  2 10:52 .
      drwxr-xr-x 12 kazumi kazumi 4096 May 12 13:56 ..
      -rw-r--r--  1 kazumi kazumi    0 Feb  4 12:50 .gitkeep
      drwxr-xr-x  2 kazumi kazumi 4096 May  3 22:24 lib
      drwxr-xr-x  2 kazumi kazumi 4096 May  3 23:23 test
    TEXT
    file_data_list = ['.', '..', '.gitkeep', 'lib', 'test'].map { |file| FileData.new(file) }
    assert_equal expected, LongFileList.new(file_data_list).show_list.join("\n")
  end
end
