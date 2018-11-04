require './test/test_helper'
require './lib/decryptor'

class DecryptorTest < Minitest::Test
  
  def setup
    cipher = 'keder ohulw'
    shifts = [3, 27, 73, 20]
    @decryptor = Decryptor.new(cipher, shifts)
  end
  
  def test_it_exists
    assert_instance_of Decryptor, @decryptor
  end
  
  def test_it_can_decrypt_message
    assert_equal 'hello world', @decryptor.decrypt
  end
  
  def test_it_can_split_message_into_chunks_of_four_characters
    expected = [['k', 'e', 'd', 'e'], ['r', ' ',  'o', 'h'], ['u', 'l', 'w']]
    assert_equal expected, @decryptor.four_split
    
    decryptor = Decryptor.new('keder ohulw!', [3, 27, 73, 20])
    expected = [['k', 'e', 'd', 'e'], ['r', ' ',  'o', 'h'], ['u', 'l', 'w', '!']]
    assert_equal expected, decryptor.four_split
  end
  
  def test_it_can_make_shifts_negative
    shifts = [3, 27, 73, 20]
    assert_equal [-3, -27, -73, -20], @decryptor.get_negative_shifts(shifts)
  end
  
end