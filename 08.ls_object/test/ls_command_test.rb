# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/ls_command'

class LSCommandTest < Minitest::Test
  def test_find_files
    expected = <<~TEXT.chomp
      .                   lib
      .gitkeep            test
    TEXT
    assert_equal expected, LSCommand.new(['-a']).show_list #現状このテストはエラーになる
  end
end
