require './test/test_helper'
require './lib/crack'

class CrackTest < Minitest::Test
  
  def test_it_exists
    message = 'hello world end'
    date = Date.parse('5th Nov 2018')
    key = '12345'
    crack = Crack.new(message, key, date)
    assert_instance_of Crack, crack
  end
  
  def test_it_has_attributes
    message = 'hello world end'
    date = Date.parse('5th Nov 2018')
    key = '12345'
    crack = Crack.new(message, key, date)
    assert_equal message, crack.message
    assert_equal date, crack.date
    assert_equal key, crack.key
  end
  
  def test_it_can_crack_a_cipher
    cipher = 'jcufqyeitjmuglm'
    date = Date.parse('5th Nov 2018')
    cracked = Crack.crack(cipher, date)
    assert_equal 'hello world end', cracked.message
    assert_equal date, cracked.date
    assert_equal 5, cracked.key.length
    assert_instance_of String, cracked.key
  end  
end
