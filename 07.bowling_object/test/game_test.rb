# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/game'

class GameTest < Minitest::Test
  def test_total_score_when_ninth_frame_and_next_shot_are_consecutive_strike
    assert_equal 164, Game.new.show_total_score('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,X,X')
  end

  def test_total_score_when_ninth_frame_and_next_shot_are_not_consecutive_strike
    assert_equal 139, Game.new.show_total_score('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,6,4,5')
  end
end
