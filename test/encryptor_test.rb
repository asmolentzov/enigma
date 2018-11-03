require './test/test_helper'
require './lib/encryptor'

class EncryptorTest < Minitest::Test
  
  def setup
    message = 'hello world'
    shifts = [3, 27, 73, 20]
    @encryptor = Encryptor.new(message, shifts)
  end
  
  def test_it_exists
    assert_instance_of Encryptor, @encryptor
  end
  
  def test_it_can_encrypt_message
    assert_equal 'keder ohulw', @encryptor.encrypt
  end
  
  def test_it_can_split_message_into_chunks_of_four_characters
    expected = [['h', 'e', 'l', 'l'], ['o', ' ',  'w', 'o'], ['r', 'l', 'd']]
    assert_equal expected, @encryptor.four_split
    message = 'hello world!'
    encryptor = Encryptor.new(message, [3, 27, 73, 20])
    expected = [['h', 'e', 'l', 'l'], ['o', ' ',  'w', 'o'], ['r', 'l', 'd', '!']]
    assert_equal expected, encryptor.four_split
  end
  
end
