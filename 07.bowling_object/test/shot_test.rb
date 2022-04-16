# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/shot'

class ShotTest < Minitest::Test
  def test_shot
    assert_equal [6, 3, 2, 10, 0], Shot.new.create_shots('6, 3, 2, X')
  end
end
