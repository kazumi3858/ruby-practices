# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/frame'

class FrameTest < Minitest::Test
  def test_frame
    assert_equal 18, Frame.new('X', '0', '8').score
    assert_equal 5, Frame.new('4', '1').score
  end
end
