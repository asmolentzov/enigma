require './test/test_helper'
require './lib/encryptor'

class EncryptorTest < Minitest::Test
  
  def setup
    message = "hello world"
    shifts = [3, 27, 73, 20]
    @encryptor = Encryptor.new(message, shifts)
  end
  
  def test_it_exists
    assert_instance_of Encryptor, @encryptor
  end
  
  def test_it_can_encrypt_message
    assert_equal “keder ohulw”, @encryptor.encrypt
  end
  
  
end
