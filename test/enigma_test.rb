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
  
  def test_it_can_encrypt_a_message_with_uppercase_characters
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
              }
    assert_equal expected, @enigma.encrypt("HELLO WORLD", "02715", "040895")
    assert_equal expected, @enigma.encrypt("HeLlo World", "02715", "040895")
  end
  
  def test_it_can_encrypt_a_message_with_special_characters
    expected = {
                encryption: "keder ohulw!?",
                key: "02715",
                date: "040895"
              }
    assert_equal expected, @enigma.encrypt("hello world!?", "02715", "040895")
    message = "hello? world?!?"
    cipher = @enigma.encrypt(message, "02715", "040895")[:encryption]
    decryption = @enigma.decrypt(cipher, "02715", "040895")[:decryption]
    assert_equal message, decryption
  end
  
  def test_it_can_encrypt_a_message_with_no_key
    result = @enigma.encrypt("hello world", "040895")
    assert_instance_of String, result[:encryption]
    assert_equal 'hello world'.length, result[:encryption].length
    assert_equal '040895', result[:date]
    assert_instance_of String, result[:key]
    assert_equal 5, result[:key].length
  end
  
  def test_it_can_encrypt_a_message_with_no_date
    result = @enigma.encrypt('hello world', '02715')
    date = Date.today.strftime('%d%m%y')
    assert_instance_of String, result[:encryption]
    assert_equal 'hello world'.length, result[:encryption].length
    assert_equal '02715', result[:key]
    assert_equal date, result [:date]
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
  
  def test_it_can_decrypt_a_cipher
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
              }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end
  
  def test_it_can_decrypt_a_cipher_with_no_date
    date = Date.today.strftime('%d%m%y')
    result = @enigma.decrypt("keder ohulw", "02715")
    assert_equal '02715', result[:key]
    assert_equal date, result[:date]
    assert_equal 'keder ohulw'.length, result[:decryption].length
    assert_instance_of String, result[:decryption]
  end
  
  def test_it_can_encrypt_and_then_decrypt
    encryption = @enigma.encrypt("hello world", "02715", "040895")
    decryption = @enigma.decrypt(encryption[:encryption], '02715', '040895')
    assert_equal 'hello world', decryption[:decryption]
  end
  
  def test_it_can_encrypt_and_then_decrypt_with_no_date
    encryption = @enigma.encrypt("hello world", "02715")
    decryption = @enigma.decrypt(encryption[:encryption], '02715')
    assert_equal 'hello world', decryption[:decryption]
  end
  
  def test_it_can_crack_a_cipher
    date = Date.parse('4th Nov 2018').strftime('%d%m%y')
    encryption = @enigma.encrypt('hello world end', date)
    cracked = @enigma.crack(encryption[:encryption], date)
    assert_equal 'hello world end', cracked[:decryption]
    assert_equal encryption[:key], cracked[:key]
    assert_equal encryption [:date], cracked[:date]
  end
end
