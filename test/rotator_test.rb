require './lib/rotator'

class RotatorTests < Minitest::Test
  
  def test_it_exists
    character_set = ("a".."z").to_a << " "
    rotator = Rotator.new(character_set)
    assert_instance_of Rotator, rotator
  end
  
  def test_it_has_a_character_set
    character_set = ("a".."z").to_a << " "
    rotator = Rotator.new(character_set)
    assert_equal character_set, rotator.character_set
  end
  
end
