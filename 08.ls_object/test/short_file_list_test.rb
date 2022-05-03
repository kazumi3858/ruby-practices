# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/short_file_list"

class ShortFileListTest < Minitest::Test
  def test_short_file_list1
    expected = <<~TEXT.chomp
      test                .gitkeep            .                   
      lib                 ..                  test                
      .gitkeep            .                   
      ..                  test                
    TEXT
    test_list1 = ["test","lib",".gitkeep","..",".gitkeep","..",".","test",".","test"]
    assert_equal expected, ShortFileList.new(test_list1).show_list.join("\n")
  end

  def test_long_file_list2
    expected = <<~TEXT.chomp
      test                .gitkeep            
      lib                 .                   
    TEXT
    test_list2 = ["test", "lib", ".gitkeep", "."]
    assert_equal expected, ShortFileList.new(test_list2).show_list.join("\n")
  end
end

