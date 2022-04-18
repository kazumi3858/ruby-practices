# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/shot'

class ShotTest < Minitest::Test
  def test_shot
    assert_equal [6, 3, 9, 0, 0, 3, 8, 2, 7, 3, 10, 0, 9, 1, 8, 0, 10, 0, 6, 4, 5],
                 Shot.new.create_shots('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,6,4,5')
  end
end
