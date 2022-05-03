# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/ls_command'

class LSCommandTest < Minitest::Test
  def test_find_files
    assert_equal %w[lib test], LSCommand.new.find_files(false)
    assert_equal ['.', '.gitkeep', 'lib', 'test'], LSCommand.new.find_files(true)
  end

  def test_sort_files
    assert_equal %w[lib test], LSCommand.new.sort_files(false)
    assert_equal %w[test lib], LSCommand.new.sort_files(true)
  end
end
