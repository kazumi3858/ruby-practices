# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/frame'

class FrameTest < Minitest::Test
  def test_frame
    assert_equal [[10, 0], [5, 3], [1, 5]], Frame.new.create_frames("X, 5, 3, 1, 5")
  end
end
