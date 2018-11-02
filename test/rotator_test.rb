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
    assert_equal 'c', @rotator.rotate('a', 2)
    assert_equal 'k', @rotator.rotate('h', 3)
  end
  
  def test_it_can_rotate_a_character_looping_alphabet
    assert_equal 'e', @rotator.rotate('l', 20)
    assert_equal 'a', @rotator.rotate('z', 2)
  end
  
  def test_it_can_rotate_a_character_by_more_than_26
    assert_equal 'b', @rotator.rotate('a', 28)
    assert_equal 'd', @rotator.rotate('l', 73)
  end
  
end
