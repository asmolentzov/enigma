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
    assert_equal 'b', @rotator.rotate_character('a', 1)
    assert_equal 'c', @rotator.rotate_character('a', 2)
    assert_equal 'k', @rotator.rotate_character('h', 3)
  end
  
  def test_it_can_rotate_a_character_looping_alphabet
    assert_equal 'e', @rotator.rotate_character('l', 20)
    assert_equal 'a', @rotator.rotate_character('z', 2)
  end
  
  def test_it_can_rotate_a_character_by_more_than_26
    assert_equal 'b', @rotator.rotate_character('a', 28)
    assert_equal 'd', @rotator.rotate_character('l', 73)
  end
  
  def test_it_can_return_character_if_not_in_character_set
    assert_equal '&', @rotator.rotate_character('&', 4)
    assert_equal '!', @rotator.rotate_character('!', 29)
  end
  
  def test_it_can_rotate_four_characters
    actual = @rotator.rotate_four(['a', 'b', 'c', 'd'], [1, 2, 3, 4])
    assert_equal ['b', 'd', 'f', 'h'], actual
  end
  
  def test_it_can_get_rotation_amount
    assert_equal 1, @rotator.get_amount('b', 'a')
    assert_equal 4, @rotator.get_amount('f', 'b')
    assert_equal 27, @rotator.get_amount('a', 'a')
  end
  
end
