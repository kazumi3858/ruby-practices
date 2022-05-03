# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/long_file_list"

class LongFileListTest < Minitest::Test
  def test_long_file_list
    expected = <<~TEXT.chomp
      total 16
      drwxr-xr-x  4 kazumi kazumi 4096 May  2 10:52 .
      drwxr-xr-x 12 kazumi kazumi 4096 Feb  4 12:50 ..
      -rw-r--r--  1 kazumi kazumi    0 Feb  4 12:50 .gitkeep
      drwxr-xr-x  2 kazumi kazumi 4096 May  2 11:40 lib
      drwxr-xr-x  2 kazumi kazumi 4096 May  2 10:53 test
    TEXT
    assert_equal expected, LongFileList.new([".", "..", ".gitkeep", "lib", "test"]).show_list
  end
end
