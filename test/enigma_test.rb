require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end
  
  def test_it_exists
    assert_instance_of Enigma, @enigma
  end
  
  def test_it_can_encrypt_a_message
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
              }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end
  
  def test_it_can_encrypt_a_message_with_no_key
    result = @enigma.encrypt("hello world", "040895")
    assert_equal 'keder ohulw', result[:encryption]
    assert_equal '040895', result[:date]
    assert_instance_of String, result[:key]
    assert_equal 5, result[:key].length
  end
  
  def test_it_can_encrypt_a_message_with_no_date
    date = Date.today.strftime('%d%m%y')
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: date
              }
    assert_equal expected, @enigma.encrypt('hello world', '02715')
  end
  
  def test_it_can_encrypt_a_message_with_no_key_or_date
    result = @enigma.encrypt('hello world')
    date = Date.today.strftime('%d%m%y')
    assert_instance_of String, result[:encryption]
    assert_equal 'hello world'.length, result[:encryption].length
    assert_instance_of String, result[:key]
    assert_equal 5, result[:key].length
    assert_equal date, result [:date]
  end
  
end
