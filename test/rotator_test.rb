require './test/test_helper'
require './lib/rotator'

class RotatorTests < Minitest::Test
  
  def setup
    @character_set = ("a".."z").to_a << " "
    @rotator = Rotator.new(@character_set)
  end
  
  def test_it_exists
    assert_instance_of Rotator, @rotator
  end
  
  def test_it_has_a_character_set
    assert_equal @character_set, @rotator.character_set
  end
  
  def test_it_can_rotate_a_character
    assert_equal 'b', @rotator.rotate('a', 1)
  end
  
end
