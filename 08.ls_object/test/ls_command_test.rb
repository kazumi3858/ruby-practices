# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/ls_command'

class LSCommandTest < Minitest::Test
  def test_find_files
    expected = <<~TEXT.chomp
      .                   lib
      .gitkeep            test
    TEXT
    assert_equal expected, LSCommand.new(['-a']).show_list.join("\n")
  end

  def test_sort_files
    assert_equal 'test                lib', LSCommand.new(['-r']).show_list.join("\n")
  end

  def test_without_a_and_r_options
    assert_equal 'lib                 test', LSCommand.new.show_list.join("\n")
  end
end
