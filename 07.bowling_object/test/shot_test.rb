# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/shot'

class ShotTest < Minitest::Test
  def test_shot
    assert_equal 10, Shot.new('X').score
    assert_equal 6, Shot.new('6').score
  end
end
