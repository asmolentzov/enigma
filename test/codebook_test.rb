require './test/test_helper'
require './lib/codebook'

class CodebookTest < Minitest::Test
  def setup
    message = 'hello world'
    @codebook = Codebook.new(message, [3, 27, 73, 20])
  end
  
  def test_it_exists
    assert_instance_of Codebook, @codebook
  end
  
  def test_it_can_encrypt_message
    message = 'hello world'
    shift = mock
    shift.stubs(:shifts).returns([3, 27, 73, 20])
    cipher = Codebook.encrypt(message, shift)
    assert_equal 'keder ohulw', cipher
  end
  
  def test_it_can_decrypt_message
    cipher = 'keder ohulw'
    shift = mock
    shift.stubs(:backwards_shifts).returns([3, 27, 73, 20])
    message = Codebook.decrypt(cipher, shift)
    assert_equal 'hello world', message
  end
  
  def test_it_can_code_a_phrase
    assert_equal 'keder ohulw', @codebook.code
    cipher = 'keder ohulw'
    codebook = Codebook.new(cipher, [-3, -27, -73, -20])
    assert_equal 'hello world', codebook.code
  end
  
  def test_it_can_split_message_into_chunks_of_four_characters
    expected = [['h', 'e', 'l', 'l'], ['o', ' ',  'w', 'o'], ['r', 'l', 'd']]
    assert_equal expected, @codebook.four_split
    message = 'hello world!'
    shift = mock
    shift.stubs(:shifts).returns([3, 27, 73, 20])
    codebook = Codebook.new(message, shift)
    expected = [['h', 'e', 'l', 'l'], ['o', ' ',  'w', 'o'], ['r', 'l', 'd', '!']]
    assert_equal expected, codebook.four_split
  end
end
