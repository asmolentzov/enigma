require './test/test_helper'
require './lib/crack'

class CrackTest < Minitest::Test
  
  def test_it_exists
    cipher = 'aldjfalksdjfla'
    date = Date.parse('5th Nov 2018')
    crack = Crack.new(cipher, date)
    assert_instance_of Crack, crack
  end
  
  def test_it_has_attributes
    cipher = 'jcufqyeitjmuglm'
    date = Date.parse('5th Nov 2018')
    crack = Crack.new(cipher, date)
    assert_equal cipher, crack.cipher
    assert_equal date, crack.date
  end
  
  def test_its_key_and_decryption_starts_blank
    cipher = 'jcufqyeitjmuglm'
    date = Date.parse('5th Nov 2018')
    crack = Crack.new(cipher, date)
    assert_equal '', crack.key
    assert_equal '', crack.decryption
  end
  
  def test_it_can_crack_a_cipher
    cipher = 'jcufqyeitjmuglm'
    date = Date.parse('5th Nov 2018')
    cracked = Crack.new(cipher, date).crack
    assert_equal 'hello world end', cracked.decryption
    assert_equal date, cracked.date
    assert_equal '74344', cracked.key
  end
  
end
